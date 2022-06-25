extends Control








func _input(event):
	if event is InputEventKey:
		if Input.is_action_pressed("esc"):
			hide()




func _on_BackGenericButton_pressed():
	hide()


func _on_OptionsGenericButton_pressed():
	show()
