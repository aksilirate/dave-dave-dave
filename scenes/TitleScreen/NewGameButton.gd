extends Button




func _on_NewGameButton_pressed():
	Audio.play("res://assets/sounds/button_press.wav")
	if Save.exists():
		Save.delete()
	Globals.ghost_mode = false
	Globals.zero_deaths_mode = false
	get_tree().change_scene("res://scenes/Game/Game.tscn")
