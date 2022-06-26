extends CanvasLayer



func _ready():
	Game.connect("current_state_changed", self, "_on_current_game_state_changed")



func _on_current_game_state_changed():
	if Game.WORLD_STATES.has(Game.current_state):
		scale = Vector2(1.0, 1.0)
		return
	scale = Vector2(0.0, 0.0)
