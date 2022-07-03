extends Node

enum LobbyAvailability {PRIVATE, FRIENDS, PUBLIC, INVISIBLE}

onready var network_editor = DataLoader.network_data as NetworkEditor
onready var chat_input_data: ChatInputData = DataLoader.chat_input_data



func _ready():
	Steam.connect("lobby_created", self, "_on_lobby_created")
	Steam.connect("lobby_joined", self, "_on_lobby_joined")
	Steam.connect("join_requested", self, "_on_join_requested")
	Steam.connect("p2p_session_request", self, "_on_p2p_session_request")
	Steam.connect("lobby_chat_update", self, "_on_lobby_chat_update")
	network_editor.connect("packet_set", self, "_on_packet_set")
	
	chat_input_data.connect("activated", self, "_on_chat_input_activated")





func _on_lobby_created(status: int, lobby_id: int):
	if status == 1:
		network_editor.set_lobby_id(lobby_id)
		print("lobby created")





func _on_lobby_joined(arg_lobby_id: int, _permissions: int, _locked: bool, response: int):
	if response == 1:
		print("lobby joined")
		var handshake_packet = HandshakePacket.new()
		_send_reliable_packet(0, handshake_packet.to_dictionary())
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




func _on_join_requested(lobby_id: int, _friend_id: int):
	Steam.joinLobby(lobby_id)
	network_editor.set_lobby_id(lobby_id)
	print("join requested")






func _on_p2p_session_request(remote_id: int):
	Steam.acceptP2PSessionWithUser(remote_id)
	var handshake_packet = HandshakePacket.new()
	_send_reliable_packet(0, handshake_packet.to_dictionary())
	print("p2p session requested")







func _on_lobby_chat_update(lobby_id: int, changer_id: int, making_change_id: int, chat_state: int):
	
	
	
	
	match chat_state:
		1: 
			if is_lobby_owner(lobby_id):
				print("im the owner")
			print(str(changer_id)+" has joined the lobby.")
		
		2: print(str(changer_id)+" has left the lobby.")
		
		8: print(str(changer_id)+" has been kicked from the lobby.")
		
		16: print(str(changer_id)+" has been banned from the lobby.")
		
		_: print("did something")





func _on_packet_set():
	print("wtf")
	var packet = network_editor.packet
	if packet is HandshakePacket:
		print("handshake")




func _on_chat_input_activated():
	var chat_packet: ChatPacket = ChatPacket.new()
	chat_packet.text = chat_input_data.text
	for member_id in get_lobby_member_ids():
		_send_reliable_packet(member_id, chat_packet.to_dictionary())





func _process(delta):
	if network_editor.lobby_id:
		_read_packet()








func _read_packet() -> void:
	var packet_size: int = Steam.getAvailableP2PPacketSize(0)
	if packet_size:
		var packet: Dictionary = Steam.readP2PPacket(packet_size, 0)
		
		if packet.empty():
			return
		
		if packet == null:
			return
		
		var packet_sender: int = packet.steam_id_remote
		
		var packet_data: Dictionary = bytes2var(packet.data)
		
		print(packet_data.type)
		
		match packet_data.type:
			Packet.Type.HANDSHAKE:
				var handshake_packet = HandshakePacket.new()
				network_editor.set_packet(handshake_packet.from_dictionary(packet_data))
				
				
			Packet.Type.CHAT:
				var chat_packet = ChatPacket.new()
				network_editor.set_packet(chat_packet.from_dictionary(packet_data))








func _create_lobby() -> void:
	Steam.createLobby(LobbyAvailability.PUBLIC, 100)








func _send_unreliable_packet(target_id: int, packet_data: Dictionary):
	pass








func _send_reliable_packet(target_id: int, packet_data: Dictionary):
	var packet_bytes: PoolByteArray
	packet_bytes.append_array(var2bytes(packet_data))
	
	Steam.sendP2PPacket(target_id, packet_bytes, Steam.P2P_SEND_RELIABLE, 0)







func get_lobby_member_ids() -> Array:
	var member_ids: Array = []
	for member_index in Steam.getNumLobbyMembers(network_editor.lobby_id):
		member_ids.push_back(Steam.getLobbyMemberByIndex(network_editor.lobby_id, member_index))
	return member_ids



func is_lobby_owner(lobby_id) -> bool:
	return Steam.getLobbyOwner(lobby_id) == Steam.getSteamID()





func _on_StartServerGenericButton_pressed():
	_create_lobby()
