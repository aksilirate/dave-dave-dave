class_name GenericButtonEditor
extends GenericButtonData





func set_last_button_pressed(value):
	last_button_pressed = value
	emit_signal("last_button_pressed_set")
	emit_changed()
