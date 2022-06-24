class_name OptionsEditor
extends OptionsData


func set_fullscreen(value):
	if fullscreen != value:
		fullscreen = value
		emit_signal("fullscreen_changed")
		emit_changed()
