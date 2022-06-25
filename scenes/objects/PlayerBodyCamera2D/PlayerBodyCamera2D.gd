extends Camera2D



func _ready():
	Game.connect("current_state_changed", self, "_on_current_state_changed")
	current = false



func _on_current_state_changed():
	if Game.WORLD_STATES.has(Game.current_state):
		current = true
		return
	current = false

#
#func _ready():
## warning-ignore:return_value_discarded
#	Options.connect("smooth_camera_updated", self, "_on_options_smooth_camera_updated")
#
#	smoothing_enabled = false
#	if Options.get_smooth_camera():
#		smoothing_enabled = true
#
#
#func _on_options_smooth_camera_updated():
#	smoothing_enabled = false
#	if Options.get_smooth_camera():
#		smoothing_enabled = true
