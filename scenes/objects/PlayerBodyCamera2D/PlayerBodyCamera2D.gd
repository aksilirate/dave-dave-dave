extends Camera2D


onready var options_data: OptionsData = DataLoader.options_data


func _ready():
	options_data.connect("smooth_camera_changed", self, "_on_smooth_camera_changed")


func _on_smooth_camera_changed():
	pass

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
