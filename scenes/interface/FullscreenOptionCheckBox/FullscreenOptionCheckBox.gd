extends CheckBox




func _ready():
	Game.options_data.connect("fullscreen_changed", self, "_on_fullscreen_changed")
	_update_toggle()




func _on_fullscreen_changed():
	_update_toggle()


func _update_toggle():
	pressed = Game.options_data.fullscreen
