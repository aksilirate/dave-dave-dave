class_name LocalPlayerBody
extends PlayerBody





func _ready():
	player_body_editor = world_scene.world_data.local_player_body_data as PlayerBodyEditor
	emit_signal("player_body_editor_set")


func _physics_process(delta):
	if controllable:
		_move(ceil(Input.get_action_strength("move_right")) - ceil(Input.get_action_strength("move_left")))
		
		if Input.get_action_strength("jump"):
			_jump()




