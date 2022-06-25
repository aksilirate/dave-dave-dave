extends ProgressBar




var player_body_data: PlayerBodyData


func _ready():
	Game.connect("current_state_changed", self, "_on_current_game_state_changed")


func _on_current_game_state_changed():
	player_body_data = Game.current_world_data.player_body_data
	player_body_data.connect("haste_changed", self, "_on_player_body_haste_changed")



func _on_player_body_haste_changed():
	value = player_body_data.haste * 10.0
