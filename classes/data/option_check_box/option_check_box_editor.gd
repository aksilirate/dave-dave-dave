class_name OptionCheckBoxEditor
extends OptionCheckBoxData






func set_hide_pet_pressed(value):
	if hide_pet_pressed != value:
		hide_pet_pressed = value
		emit_signal("hide_pet_pressed_changed")
