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



func set_smooth_camera(value):
	if smooth_camera != value:
		smooth_camera = value
		emit_signal("smooth_camera_changed")
		emit_changed()




func set_interface_selection(value):
	if interface_selection != value:
		interface_selection = value
		emit_signal("interface_selection_changed")
		emit_changed()

func set_music_volume_db(value):
	if music_volume_db != value:
		music_volume_db = value
		emit_signal("music_volume_db_changed")
		emit_changed()



func set_sfx_volume_db(value):
	if sfx_volume_db != value:
		sfx_volume_db = value
		emit_signal("sfx_volume_db_changed")
		emit_changed()
