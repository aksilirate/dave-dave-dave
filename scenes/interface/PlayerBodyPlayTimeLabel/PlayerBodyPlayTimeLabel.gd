extends Label


onready var current_game_state: WorldGameState = DataLoader.game_state_data.current_game_state as WorldGameState
onready var local_player_body_data: PlayerBodyData = current_game_state.world_data.local_player_body_data



func _ready():
	local_player_body_data.connect("play_time_changed", self, "_on_local_player_body_play_time_changed")



func _on_local_player_body_play_time_changed():
	text = Time.get_formatted(local_player_body_data.play_time)


