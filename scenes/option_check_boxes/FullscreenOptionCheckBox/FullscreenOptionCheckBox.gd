extends OptionCheckBox





func _ready():
	pressed = options_data.fullscreen




func _on_FullscreenOptionCheckBox_toggled(button_pressed):
	option_check_box_editor.set_fullscreen_pressed(button_pressed)
