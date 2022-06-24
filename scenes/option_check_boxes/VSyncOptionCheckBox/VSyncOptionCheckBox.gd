extends OptionCheckBox






func _ready():
	Game.options_data.connect("v_sync_changed", self, "_on_v_sync_changed")



func _on_v_sync_changed():
	_update_toggle()



func _update_toggle():
	pressed = Game.options_data.v_sync


