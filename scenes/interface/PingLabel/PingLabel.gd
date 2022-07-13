class_name PingLabel
extends Label



onready var network_data: NetworkData = DataLoader.network_data



var _signal


func _ready():
	_signal = network_data.connect("ping_changed", self, "_on_ping_changed")




func _on_ping_changed():
	text = str(network_data.ping)
