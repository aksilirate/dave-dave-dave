class_name LocalPlayerBody
extends PlayerBody



onready var chat_input_data: ChatInputData = DataLoader.chat_input_data

func _ready():
	player_body_editor = world_scene.world_data.local_player_body_data as PlayerBodyEditor
	emit_signal("player_body_editor_set")







func _physics_process(delta):
	if is_controllable():
		var input_direction: int = ceil(Input.get_action_strength("move_right")) - ceil(Input.get_action_strength("move_left"))
		
		_move(input_direction)
		
		if Input.get_action_strength("jump"):
			_jump()
			
		return
		
	_move(0)




func is_controllable() -> bool:
	return !chat_input_data.shown




