class_name NetworkManager
extends Node



enum LobbyAvailability {PRIVATE, FRIENDS, PUBLIC, INVISIBLE}

onready var network_editor = DataLoader.network_data as NetworkEditor
onready var chat_input_data: ChatInputData = DataLoader.chat_input_data


var _signal

func _ready():
	_signal = Steam.connect("lobby_created", self, "_on_lobby_created")
	_signal = Steam.connect("lobby_joined", self, "_on_lobby_joined")
	_signal = Steam.connect("join_requested", self, "_on_join_requested")
	_signal = Steam.connect("p2p_session_request", self, "_on_p2p_session_request")
	_signal = Steam.connect("lobby_chat_update", self, "_on_lobby_chat_update")
	_signal = network_editor.connect("packet_received", self, "_on_packet_received")
	_signal = chat_input_data.connect("activated", self, "_on_chat_input_activated")





func _on_lobby_created(status: int, lobby_id: int):
	if status == 1:
		network_editor.set_lobby_id(lobby_id)
		print("lobby created")





func _on_lobby_joined(_lobby_id: int, _permissions: int, _locked: bool, response: int):
	if response == 1:
		print("lobby joined")
		network_editor.set_connected_players(get_lobby_member_ids())
		var handshake_packet = HandshakePacket.new()
		for member_id in get_lobby_member_ids():
			_send_reliable_packet(member_id, handshake_packet)
		return
	
	var error: String
	
	match response:
		2: error = "This lobby no longer exists."
		3: error = "You don't have permission to join this lobby."
		4: error = "The lobby is now full."
		5: error = "Uh... something unexpected happened!"
		6: error = "You are banned from this lobby."
		7: error = "You cannot join due to having a limited account."
		8: error = "This lobby is locked or disabled."
		9: error = "This lobby is community locked."
		10: error = "A user in the lobby has blocked you from joining."
		11: error = "A user you have blocked is in the lobby."
	
	if error:
		print(error)



func _on_join_requested(lobby_id: int, _friend_id: int):
	Steam.joinLobby(lobby_id)
	network_editor.set_lobby_id(lobby_id)
	print("join requested")






func _on_p2p_session_request(remote_id: int):
	var _error = Steam.acceptP2PSessionWithUser(remote_id)
	var handshake_packet = HandshakePacket.new()
	for member_id in get_lobby_member_ids():
		_send_reliable_packet(member_id, handshake_packet)
	print("p2p session requested")







func _on_lobby_chat_update(_lobby_id: int, changer_id: int, _making_change_id: int, chat_state: int):
	match chat_state:
		1: 
			if not network_editor.connected_players.has(changer_id):
				network_editor.add_to_connected_players(changer_id)
			
			if network_editor.is_lobby_owner():
				var game_state_packet = GameStatePacket.new()
				game_state_packet.scene_path = get_tree().current_scene.filename
				_send_reliable_packet(changer_id, game_state_packet)
				
			print(str(changer_id)+" has joined the lobby.")
		
		2: 
			if network_editor.connected_players.has(changer_id):
				network_editor.remove_from_connected_players(changer_id)
			print(str(changer_id)+" has left the lobby.")
		
		8: print(str(changer_id)+" has been kicked from the lobby.")
		
		16: print(str(changer_id)+" has been banned from the lobby.")
		
		_: print("did something")





func _on_packet_received():
	var packet = network_editor.received_packet
	if packet is HandshakePacket:
		print("handshake")
	
	if packet is PingRequestPacket:
		var ping_response_packet = PingResponsePacket.new()
		ping_response_packet.tick_requested = packet.tick_sent
		_send_reliable_packet(packet.sender_id, ping_response_packet)
	
	if packet is PingResponsePacket:
		network_editor.set_ping(OS.get_ticks_msec() - packet.tick_requested)





func _on_chat_input_activated():
	var chat_packet: ChatPacket = ChatPacket.new()
	chat_packet.text = chat_input_data.text
	for member_id in get_lobby_member_ids():
		_send_reliable_packet(member_id, chat_packet)





func _process(_delta):
	if network_editor.lobby_id:
		_read_all_packets()




func _read_all_packets(read_count: int = 0):
	if read_count >= 32:
		return
	if Steam.getAvailableP2PPacketSize(0) > 0:
		_read_packet()
		_read_all_packets(read_count + 1)







func _read_packet() -> void:
	var packet_size: int = Steam.getAvailableP2PPacketSize(0)
	if packet_size:

		var sent_packet: Dictionary = Steam.readP2PPacket(packet_size, 0)
		
		if sent_packet.empty():
			return
		
		if sent_packet == null:
			return
		
		var _packet_sender: int = sent_packet.steam_id_remote
		
		var packet: Packet = dict2inst(bytes2var(sent_packet.data))
		
		
		network_editor.set_received_packet(packet)








func _create_lobby() -> void:
	Steam.createLobby(LobbyAvailability.PUBLIC, 100)







func _send_unreliable_packet(target_id: int, packet: Packet):
	var packet_bytes: PoolByteArray = PoolByteArray([])
	packet_bytes.append_array(var2bytes(inst2dict(packet)))
	var success = Steam.sendP2PPacket(target_id, packet_bytes, Steam.P2P_SEND_UNRELIABLE, 0)
	
	if success:
		network_editor.set_sent_packet(packet)
		return
	
	print("failed sending unreliable packet")




func _send_reliable_packet(target_id: int, packet: Packet):
	var packet_bytes: PoolByteArray = PoolByteArray([])
	packet_bytes.append_array(var2bytes(inst2dict(packet)))
	var success = Steam.sendP2PPacket(target_id, packet_bytes, Steam.P2P_SEND_RELIABLE, 0)
	
	if success:
		network_editor.set_sent_packet(packet)
		return
	
	print("failed sending reliable packet")






func get_lobby_member_ids() -> Array:
	var member_ids: Array = []
	for member_index in Steam.getNumLobbyMembers(network_editor.lobby_id):
		var member_id: int = Steam.getLobbyMemberByIndex(network_editor.lobby_id, member_index)
		if not member_id == Steam.getSteamID():
			member_ids.push_back(member_id)
	return member_ids





func _on_StartServerGenericButton_pressed():
	_create_lobby()




func _on_PingRequestTimer_timeout():
	if not network_editor.lobby_id:
		return
	
	if network_editor.is_lobby_owner():
		return
	
	var ping_request_packet = PingRequestPacket.new()
	ping_request_packet.sender_id = Steam.getSteamID()
	ping_request_packet.tick_sent = OS.get_ticks_msec()
	_send_reliable_packet(network_editor.get_looby_owner_id(), ping_request_packet)
