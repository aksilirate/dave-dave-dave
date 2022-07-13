extends OptionCheckBox


var _signal



func _ready():
	_signal = options_data.connect("fullscreen_changed", self, "_on_fullscreen_changed")



func _on_fullscreen_changed():
	_update_toggle()


func _update_toggle():
	pressed = options_data.fullscreen
