class_name LocalPlayerBody
extends PlayerBody




var esc_menu_open: bool


func _physics_process(_delta):
	if is_controllable():
		var input: Vector2
		var x_input: int = int(ceil(Input.get_action_strength("move_right")) - ceil(Input.get_action_strength("move_left")))
		var y_input = Input.get_action_strength("jump")
		input = Vector2(x_input, y_input)
		
		player_body_editor.set_input(input)
		last_input_recieved = input
		
		return






func get_player_body_editor() -> PlayerBodyEditor:
	return current_game_state.world_data.local_player_body_data as PlayerBodyEditor



func get_player_id() -> int:
	return Steamworks.steam_id



func is_controllable() -> bool:
#	if chat_input_data.shown:
#		return false
	
	if cutscene_animation_player_data.playing:
		return false
	
	if esc_menu_open:
		return false
	
	return .is_controllable()






func _on_WorldEscTabContainer_opened():
	esc_menu_open = true



func _on_WorldEscTabContainer_closed():
	esc_menu_open = false

