class_name GameStateManager
extends Node


export(String, FILE) var new_adventure_play_state_path
export(String, FILE) var adventure_play_state_path




func _on_ExitGenericButton_pressed():
	get_tree().quit()


func _on_AdventureNewGameGenericButton_pressed():
	get_tree().change_scene(new_adventure_play_state_path)


func _on_AdventureContinueGenericButton_pressed():
	get_tree().change_scene(adventure_play_state_path)
