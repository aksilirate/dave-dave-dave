extends Node

enum LobbyAvailability {PRIVATE, FRIENDS, PUBLIC, INVISIBLE}

var lobby_id: int



func _ready():
	Steam.connect("join_requested", self, "_on_join_requested")



func _on_join_requested():
	print("join requested")



func _process(delta):
	if lobby_id:
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
