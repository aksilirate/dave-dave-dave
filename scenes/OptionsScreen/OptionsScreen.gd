extends Control



func _on_BackButton_pressed():
	Audio.play("res://assets/sounds/button_press.wav")
	queue_free()


func _on_FullscreenCheckBox_toggled(button_pressed):
	OS.window_fullscreen = button_pressed
	Options.set_fullscreen(button_pressed)
