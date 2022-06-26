class_name LocalPlayerBody
extends PlayerBody




func _physics_process(delta):
	if controllable:
		_move(ceil(Input.get_action_strength("move_right")) - ceil(Input.get_action_strength("move_left")))
		
		if Input.get_action_strength("jump"):
			_jump()






