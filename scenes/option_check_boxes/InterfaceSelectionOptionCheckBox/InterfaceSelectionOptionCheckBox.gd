extends OptionCheckBox




func _ready():
	pressed = options_data.interface_selection


func _on_InterfaceSelectionOptionCheckBox_toggled(button_pressed):
	option_check_box_editor.set_interface_selection_pressed(button_pressed)
