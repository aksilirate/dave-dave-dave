class_name StartServerGenericButton
extends GenericButton


onready var network_data: NetworkData = DataLoader.network_data


func _ready():
	network_data.connect("lobby_id_changed", self, "_on_lobby_id_changed")



func _on_lobby_id_changed():
	if network_data.lobby_id:
		disabled = true
		return
	disabled = false
