extends OptionCheckBox


var _signal


func _ready():
	pressed = options_data.v_sync






func _on_VSyncOptionCheckBox_toggled(button_pressed):
	option_check_box_editor.set_v_sync_pressed(button_pressed)
