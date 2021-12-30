extends Control



func _on_BackButton_pressed():
	Audio.play("res://assets/sounds/button_press.wav")
	queue_free()


func _on_FullscreenCheckBox_toggled(button_pressed):
	OS.window_fullscreen = button_pressed
	Options.set_fullscreen(button_pressed)


func _on_DPadCheckBox_toggled(button_pressed):
	Options.set_d_pad(button_pressed)


func _on_SmoothCameraCheckBox_toggled(button_pressed):
	Options.set_smooth_camera(button_pressed)


func _on_HidePetCheckBox_toggled(button_pressed):
	Options.set_hide_pet(button_pressed)
