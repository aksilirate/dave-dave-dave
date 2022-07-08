class_name PingLabel
extends Label



onready var network_data: NetworkData = DataLoader.network_data



func _ready():
	network_data.connect("ping_changed", self, "_on_ping_changed")




func _on_ping_changed():
	text = str(network_data.ping)
