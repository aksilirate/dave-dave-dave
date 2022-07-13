class_name AdventureWorld
extends WorldScene




var _signal

func _ready():
	_signal = network_data.connect("connected_players_changed", self, "_on_connected_players_changed")




func _on_connected_players_changed():
	for element in network_data.connected_players:
		var connected_player_id: int = element
		if not world_editor.online_player_bodies_data.keys().has(connected_player_id):
			var online_player_body_data = DataResource.init_data(DataLoader.data_path + "/adventure_world/OnlinePlayerBody" + str(connected_player_id) +".tres", PlayerBodyEditor.new()) as PlayerBodyData
			world_editor.add_to_online_player_bodies_data(connected_player_id, online_player_body_data)
	world_editor.emit_signal("online_player_bodies_data_loaded")
