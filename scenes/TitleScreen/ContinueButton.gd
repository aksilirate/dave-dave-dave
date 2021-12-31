extends Button




func _ready():
	disabled = !Save.exists()
	if Save.exists():
		grab_focus()



func _on_ContinueButton_pressed():
	Audio.play("res://assets/sounds/button_press.wav")
	Globals.ghost_mode = false
	Globals.zero_deaths_mode = false
	if get_tree().change_scene("res://scenes/Game/Game.tscn") != OK:
		print("error: couldnt change scene to Game.tscn")



func _input(event):
	if event is InputEventKey:
		if Input.is_action_pressed("down") or Input.is_action_pressed("up"):
			if not get_focus_owner() and Save.exists():
				if !get_tree().get_nodes_in_group("options_screens").size():
					if OS.get_name() != "Android":
						grab_focus()
