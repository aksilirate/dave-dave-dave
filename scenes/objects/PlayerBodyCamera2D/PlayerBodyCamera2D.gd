extends Camera2D



export(NodePath) onready var player_body = get_node(player_body) as PlayerBody




func _ready():
	player_body.connect("player_body_data_set", self, "_on_player_body_data_set")



func _on_player_body_data_set():
	if player_body.id == 0:
		current = true



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
