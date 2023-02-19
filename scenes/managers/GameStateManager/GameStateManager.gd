class_name GameStateManager
extends Node


onready var game_state_editor = DataLoader.game_state_data as GameStateEditor

var world_data: WorldData

var _signal



func _ready():
	_signal = game_state_editor.connect("current_state_changed", self, "_on_current_state_changed")




func _on_current_state_changed():
	var _error = get_tree().change_scene(game_state_editor.current_game_state.path)
	
#	if game_state_editor.current_game_state == null:
#		return
#
#	if not game_state_editor.current_game_state is WorldGameState:
#		return
#
#	world_data = game_state_editor.current_game_state.world_data as WorldData
#	_signal = world_data.connect("completed_changed", self, "_on_world_completed_changed")







func _on_ExitGenericButton_pressed():
	get_tree().quit()



func _on_AdventureNewGameGenericButton_pressed():
	game_state_editor.set_current_game_state(DataLoader.game_states.new_adventure_play_state)
	


func _on_AdventureContinueGenericButton_pressed():
	game_state_editor.set_current_game_state(DataLoader.game_states.adventure_play_state)


func _on_ExitToTitleGenericButton_pressed():
	game_state_editor.set_current_game_state(DataLoader.game_states.title_state)



func _on_CutsceneAnimationPlayer_animation_finished(anim_name: String):
	if "finish" in anim_name:
		game_state_editor.set_current_game_state(DataLoader.game_states.title_state)

