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





func set_interface_selection_pressed(value):
	if interface_selection_pressed != value:
		interface_selection_pressed = value
		emit_signal("interface_selection_pressed_changed")
