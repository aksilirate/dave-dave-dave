extends Button





func _ready():
	disabled = !Stats.get_ghost_mode_enabled()
	if Stats.get_ghost_mode_enabled():
		text = "Ghost Mode"
