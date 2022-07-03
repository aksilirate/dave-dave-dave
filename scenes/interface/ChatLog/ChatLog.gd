class_name ChatLog
extends RichTextLabel


onready var network_data: NetworkData = DataLoader.network_data




func _ready():
	network_data.connect("packet_set", self, "_on_packet_set")



func _on_packet_set():
	var packet = network_data.packet
	if packet is ChatPacket:
		text += packet.text
