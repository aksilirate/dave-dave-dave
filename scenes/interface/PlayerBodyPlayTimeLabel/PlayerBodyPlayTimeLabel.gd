extends Label


var player_body_data: PlayerBodyData


func _ready():
	Game.connect("current_state_changed", self, "_on_current_game_state_changed")


func _on_current_game_state_changed():
	player_body_data = Game.current_world_data.player_body_data as PlayerBodyData
	player_body_data.connect("play_time_changed", self, "_on_player_body_play_time_changed")



func _on_player_body_play_time_changed():
	text = Time.get_formatted(player_body_data.play_time)


