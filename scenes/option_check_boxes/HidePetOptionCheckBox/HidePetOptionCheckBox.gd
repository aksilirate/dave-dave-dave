extends OptionCheckBox




func _ready():
	pressed = options_data.hide_pet



func _on_HidePetOptionCheckBox_toggled(button_pressed):
	option_check_box_editor.set_hide_pet_pressed(button_pressed)
