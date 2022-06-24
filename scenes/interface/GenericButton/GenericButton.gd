class_name GenericButton
extends Button


onready var generic_button_editor: GenericButtonEditor = Game.generic_button_data as GenericButtonEditor




func _on_GenericButton_pressed():
	generic_button_editor.set_last_button_pressed(self)
