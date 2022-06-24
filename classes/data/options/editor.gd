class_name OptionsEditor
extends OptionsData


func set_fullscreen(value):
	if fullscreen != value:
		fullscreen = value
		emit_signal("fullscreen_changed")
		emit_changed()


func set_v_sync(value):
	if v_sync != value:
		v_sync = value
		emit_signal("v_sync_changed")
		emit_changed()
