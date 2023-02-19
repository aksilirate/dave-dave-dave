extends OptionCheckBox






func _ready():
	pressed = options_data.smooth_camera



func _on_SmoothCameraOptionCheckBox_toggled(button_pressed):
	option_check_box_editor.set_smooth_camera_pressed(button_pressed)
