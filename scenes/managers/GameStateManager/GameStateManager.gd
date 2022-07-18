class_name GameStateManager
extends Node


onready var game_state_editor = DataLoader.game_state_data as GameStateEditor
onready var network_data: NetworkData = DataLoader.network_data

var world_data: WorldData

var _signal


func _ready():
	_signal = game_state_editor.connect("current_state_changed", self, "_on_current_state_changed")
	_signal = network_data.connect("packet_received", self, "_packet_received")




func _on_current_state_changed():
	var _error = get_tree().change_scene(game_state_editor.current_game_state.path)
	if game_state_editor.current_game_state != null:
		world_data = game_state_editor.current_game_state.world_data as WorldData
		_signal = world_data.connect("completed_changed", self, "_on_world_completed_changed")



func _on_world_completed_changed():
	if world_data.completed:
		game_state_editor.set_current_game_state(DataLoader.game_states.title_state)




func _packet_received():
	var packet = network_data.received_packet
	if packet is GameStatePacket:
		print(packet.scene_path)
		game_state_editor.set_current_game_state(DataLoader.game_states.online_play_state)






func _on_ExitGenericButton_pressed():
	get_tree().quit()



func _on_AdventureNewGameGenericButton_pressed():
	game_state_editor.set_current_game_state(DataLoader.game_states.new_adventure_play_state)
	


func _on_AdventureContinueGenericButton_pressed():
	game_state_editor.set_current_game_state(DataLoader.game_states.adventure_play_state)


func _on_ExitToTitleGenericButton_pressed():
	game_state_editor.set_current_game_state(DataLoader.game_states.title_state)

