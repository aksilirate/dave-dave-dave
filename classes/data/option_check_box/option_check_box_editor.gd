class_name OptionCheckBoxEditor
extends OptionCheckBoxData




func set_fullscreen_pressed(value):
	if fullscreen_pressed != value:
		fullscreen_pressed = value
		emit_signal("fullscreen_pressed_changed")




func set_v_sync_pressed(value):
	if v_sync_pressed != value:
		v_sync_pressed = value
		emit_signal("v_sync_pressed_changed")



func set_smooth_camera_pressed(value):
	if smooth_camera_pressed != value:
		smooth_camera_pressed = value
		emit_signal("smooth_camera_pressed_changed")



func set_hide_pet_pressed(value):
	if hide_pet_pressed != value:
		hide_pet_pressed = value
		emit_signal("hide_pet_pressed_changed")
