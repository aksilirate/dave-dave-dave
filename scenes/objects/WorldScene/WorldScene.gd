class_name WorldScene
extends Node2D


onready var current_game_state: WorldGameState = DataLoader.game_state_data.current_game_state as WorldGameState
onready var world_editor = current_game_state.world_data as WorldEditor
onready var network_data: NetworkData = DataLoader.network_data
onready var finish_area_data = DataLoader.finish_area_data as FinishAreaData


var _signal

func _ready():
	_signal = finish_area_data.connect("activated", self, "_on_finish_area_activated")
	_signal = network_data.connect("connected_players_changed", self, "_on_connected_players_changed")
	
	world_editor.set_played(true)
	if current_game_state.reset_data:
		world_editor.set_completed(false)
		world_editor.set_online_player_bodies_data({})
	
	_update_online_player_data()


func _on_finish_area_activated():
	world_editor.set_completed(true)



func _update_online_player_data():
	for element in network_data.connected_players:
		var connected_player_id: int = element
		if not world_editor.online_player_bodies_data.keys().has(connected_player_id):
			var online_player_body_data = DataResource.init_data(DataLoader.data_path + "/online_world/OnlinePlayerBody" + str(connected_player_id) +".tres", PlayerBodyEditor.new()) as PlayerBodyData
			world_editor.add_to_online_player_bodies_data(connected_player_id, online_player_body_data)
	world_editor.emit_signal("online_player_bodies_data_loaded")



func _on_connected_players_changed():
	_update_online_player_data()
