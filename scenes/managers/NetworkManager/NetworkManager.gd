extends Node

enum LobbyAvailability {PRIVATE, FRIENDS, PUBLIC, INVISIBLE}

onready var network_editor = DataLoader.network_data as NetworkEditor




func _ready():
	Steam.connect("lobby_created", self, "_on_lobby_created")
	Steam.connect("lobby_joined", self, "_on_lobby_joined")
	Steam.connect("join_requested", self, "_on_join_requested")



func _on_lobby_created(status: int, lobby_id: int):
	if status == 1:
		network_editor.set_lobby_id(lobby_id)
		print(lobby_id)
		print("lobby created")



func _on_lobby_joined(arg_lobby_id: int, _permissions: int, _locked: bool, _response: int):
	print("lobby joined")



func _on_join_requested(lobby_id: int, _friend_id: int):
	network_editor.set_lobby_id(lobby_id)
	print("joined a server")



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
		var packet_code: PoolByteArray = packet.data
		
		



func _create_lobby() -> void:
	Steam.createLobby(LobbyAvailability.PUBLIC, 100)





func _on_StartServerGenericButton_pressed():
	_create_lobby()
