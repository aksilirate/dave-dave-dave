class_name GenericButton
extends Button


onready var generic_button_editor = DataLoader.generic_button_data as GenericButtonEditor
onready var options_data: OptionsData = DataLoader.options_data

export(bool) var initial_focus_grab


var _signal


func _ready():
	_signal = options_data.connect("interface_selection_changed", self, "_on_interface_selection_changed")



func _on_interface_selection_changed():
	update_focus()




func update_focus():
	if options_data.interface_selection:
		focus_mode = Control.FOCUS_ALL
		if is_visible_in_tree():
			if initial_focus_grab:
				grab_focus()
		return
		
	focus_mode = Control.FOCUS_NONE




func _on_GenericButton_pressed():
	generic_button_editor.set_last_button_pressed(self)


func _on_GenericButton_visibility_changed():
	update_focus()

