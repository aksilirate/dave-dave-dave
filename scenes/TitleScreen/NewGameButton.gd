extends Button




func _on_NewGameButton_pressed():
	Audio.play("res://assets/sounds/button_press.wav")
	
	if !Save.exists():
		grab_focus()
	
	
	if Save.exists():
		Save.delete()
		
		
	Globals.ghost_mode = false
	Globals.zero_deaths_mode = false
	get_tree().change_scene("res://scenes/Game/Game.tscn")


func _input(event):
	if event is InputEventKey:
		if Input.is_action_pressed("down") or Input.is_action_pressed("up"):
			if not get_focus_owner() and !Save.exists():
				if !get_tree().get_nodes_in_group("options_screens").size():
					if OS.get_name() != "Android" and Options.get_enable_selection():
						grab_focus()
