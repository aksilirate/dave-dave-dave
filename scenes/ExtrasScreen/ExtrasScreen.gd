extends Control


func _on_BackButton_pressed():
	Audio.play("res://assets/sounds/button_press.wav")
	queue_free()


func _on_GhostModeButton_pressed():
	pass # Replace with function body.
