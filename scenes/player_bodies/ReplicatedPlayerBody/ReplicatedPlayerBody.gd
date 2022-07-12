class_name ReplicatedPlayerBody
extends PlayerBody






func _ready():
	player_body_editor = current_game_state.world_data.online_player_bodies_data[player_id]
	emit_signal("player_body_editor_set")


