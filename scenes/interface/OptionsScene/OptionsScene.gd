extends Control




func _ready():
	hide()



func _input(event):
	if event is InputEventKey:
		if Input.is_action_pressed("esc"):
			hide()






func _on_OptionsGenericButton_pressed():
	show()


func _on_OptionsBackGenericButton_pressed():
	hide()


func _on_InterfaceSelectionOptionCheckBox_toggled(button_pressed):
	pass # Replace with function body.
