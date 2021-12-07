extends TouchScreenButton




func _process(delta):
	modulate.a = 1.0
	if Input.get_action_strength(action):
		modulate.a = 0.5
