class_name ReplicatedPlayerBody
extends PlayerBody





func get_player_id() -> int:
	for player_id in current_game_state.world_data.online_player_bodies_data.keys():
		var online_player_body_data: PlayerBodyData = current_game_state.world_data.online_player_bodies_data[player_id]
		if online_player_body_data == player_body_editor:
			return player_id
			
	return 0
