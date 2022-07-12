class_name GameStateEditor
extends GameStateData






func set_current_game_state(value: GameState):
	if current_game_state != value:
		current_game_state = value
		emit_signal("current_state_changed")
