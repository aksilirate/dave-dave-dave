extends Button




func _on_NewGameButton_pressed():
	Audio.play("res://assets/sounds/button_press.wav")
	if Save.exists():
		Save.delete()
	get_tree().change_scene("res://scenes/Game/Game.tscn")
