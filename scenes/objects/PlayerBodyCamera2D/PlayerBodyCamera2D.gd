extends Camera2D


onready var options_data: OptionsData = DataLoader.options_data


var _signal

func _ready():
	_signal = options_data.connect("smooth_camera_changed", self, "_on_smooth_camera_changed")


func _on_smooth_camera_changed():
	smoothing_enabled = options_data.smooth_camera
