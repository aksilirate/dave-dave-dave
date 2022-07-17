extends Control




onready var network_data: NetworkData = DataLoader.network_data



func _ready():
	network_data.connect("lobby_id_changed", self, "_on_lobby_id_changed")
	hide()



func _on_lobby_id_changed():
	if network_data.is_lobby_owner():
		return
		
	show()
