class_name GameStateManager
extends Node


onready var game_state_editor = DataLoader.game_state_data as GameStateEditor




func _ready():
	game_state_editor.connect("current_state_changed", self, "_on_current_state_changed")



func _on_current_state_changed():
	get_tree().change_scene(game_state_editor.current_game_state.path)





func _on_ExitGenericButton_pressed():
	get_tree().quit()


func _on_AdventureNewGameGenericButton_pressed():
	game_state_editor.set_current_game_state(DataLoader.game_states.new_adventure_play_state)
	


func _on_AdventureContinueGenericButton_pressed():
	game_state_editor.set_current_game_state(DataLoader.game_states.adventure_play_state)


func _on_ExitToTitleGenericButton_pressed():
	game_state_editor.set_current_game_state(DataLoader.game_states.title_state)
