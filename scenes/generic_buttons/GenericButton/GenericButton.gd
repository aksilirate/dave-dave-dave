class_name GenericButton
extends Button


export(Resource) var generic_button_editor = generic_button_editor as GenericButtonEditor




func _on_GenericButton_pressed():
	generic_button_editor.set_last_button_pressed(self)
