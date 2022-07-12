class_name LocalPlayerBody
extends PlayerBody



onready var chat_input_data: ChatInputData = DataLoader.chat_input_data

func _ready():
	player_body_editor = current_game_state.world_data.local_player_body_data as PlayerBodyEditor
	player_id = Steamworks.steam_id
	emit_signal("player_body_editor_set")







func _physics_process(delta):
	if is_controllable():
		var input: Vector2
		var x_input: int = ceil(Input.get_action_strength("move_right")) - ceil(Input.get_action_strength("move_left"))
		var y_input = Input.get_action_strength("jump")
		input = Vector2(x_input, y_input)
		
		player_body_editor.set_input(input)
		last_input_recieved = input
		
		return




func is_controllable() -> bool:
	return !chat_input_data.shown




