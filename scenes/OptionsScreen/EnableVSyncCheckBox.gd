extends CheckBox




func _ready():
	if Options.exists():
		pressed = Options.get_v_sync()


func _on_EnableVSyncCheckBox_toggled(button_pressed):
	Options.set_v_sync(button_pressed)
