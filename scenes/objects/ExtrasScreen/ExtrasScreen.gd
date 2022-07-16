extends Control


func _on_BackButton_pressed():
	Audio.play("res://assets/sounds/button_press.wav")
	queue_free()


func _on_GhostModeButton_pressed():
	Audio.play("res://assets/sounds/button_press.wav")
	Globals.ghost_mode = true
	get_tree().change_scene("res://scenes/Game/Game.tscn")


func _on_ZeroDeathsModeButton_pressed():
	Audio.play("res://assets/sounds/button_press.wav")
	Globals.zero_deaths_mode = true
	get_tree().change_scene("res://scenes/Game/Game.tscn")
