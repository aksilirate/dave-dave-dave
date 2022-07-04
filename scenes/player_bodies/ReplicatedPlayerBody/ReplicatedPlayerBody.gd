class_name ReplicatedPlayerBody
extends PlayerBody



onready var network_data: NetworkData = DataLoader.network_data

var id: int



func _ready():
	network_data.connect("packet_set", self, "_on_packet_set")
	player_body_editor = world_scene.world_data.online_player_bodies_data[id]
	emit_signal("player_body_editor_set")


func _on_packet_set():
	var packet = network_data.packet
	if packet is InputPacket:
		if packet.id == id:
			_move(packet.input.x)
			if packet.input.y:
				_jump()
