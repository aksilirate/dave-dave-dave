extends Control



func _on_BackButton_pressed():
	queue_free()


func _on_FullscreenCheckBox_toggled(button_pressed):
	OS.window_fullscreen = button_pressed
