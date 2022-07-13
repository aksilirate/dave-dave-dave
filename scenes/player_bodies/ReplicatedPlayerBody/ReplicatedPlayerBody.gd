class_name ReplicatedPlayerBody
extends PlayerBody






func get_player_body_editor() -> PlayerBodyEditor:
	return current_game_state.world_data.online_player_bodies_data[player_id] as PlayerBodyEditor
