extends Control








func _input(event):
	if event is InputEventKey:
		if Input.is_action_pressed("esc"):
			hide()






func _on_OptionsGenericButton_pressed():
	show()


func _on_OptionsBackGenericButton_pressed():
	hide()
