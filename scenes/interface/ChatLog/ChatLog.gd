class_name ChatLog
extends RichTextLabel


onready var network_data: NetworkData = DataLoader.network_data




func _ready():
	network_data.connect("packet_recieved", self, "_on_packet_recieved")



func _on_packet_recieved():
	var packet = network_data.packet
	if packet is ChatPacket:
		text += "\n" + packet.text
