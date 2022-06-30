class_name LocalPlayerBody
extends PlayerBody


enum InputType {KEYBOARD, CONTROLLER}

export(InputType) var input_type


func _ready():
	player_body_editor = world_scene.world_data.local_player_bodies_data[id] as PlayerBodyEditor
	emit_signal("player_body_editor_set")


func _physics_process(delta):
	if controllable:
		match input_type:
			InputType.KEYBOARD:
				_move(ceil(Input.get_action_strength("move_right")) - ceil(Input.get_action_strength("move_left")))
				
				if Input.get_action_strength("jump"):
					_jump()
					
			InputType.CONTROLLER:
				_move(ceil(Input.get_action_strength("controller_0_move_right")) - ceil(Input.get_action_strength("controller_0_move_left")))
				
				if Input.get_action_strength("controller_0_jump"):
					_jump()





