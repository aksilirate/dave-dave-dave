extends Button




#func _on_NewGameButton_pressed():
#	Audio.play("res://assets/sounds/button_press.wav")
#
#	if !Save.exists():
#		grab_focus()
#
#
#	if Save.exists():
#		Save.delete()
#
#
#
#
#func _input(event):
#	if event is InputEventKey:
#		if Input.is_action_pressed("down") or Input.is_action_pressed("up"):
#			if not get_focus_owner() and !Save.exists():
#				if !get_tree().get_nodes_in_group("options_screens").size():
#					if Options.get_enable_selection():
#						grab_focus()
