extends OptionCheckBox



var _signal


func _ready():
	_signal = options_data.connect("smooth_camera_changed", self, "_on_smooth_camera_changed")




func _on_smooth_camera_changed():
	_update_toggle()


func _update_toggle():
	pressed = options_data.smooth_camera
