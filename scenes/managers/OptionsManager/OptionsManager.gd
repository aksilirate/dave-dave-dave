class_name OptionsManager
extends Node


onready var options_editor = DataLoader.options_data as OptionsEditor




func _ready():
	options_editor.connect("fullscreen_changed", self, "_on_fullscreen_changed")
	options_editor.connect("v_sync_changed", self, "_on_v_sync_changed")
	options_editor.connect("music_volume_db_changed", self, "_on_music_volume_db_changed")
	_update_fullscreen()
	_update_v_sync()
	_update_music_volume()




func _on_fullscreen_changed():
	_update_fullscreen()


func _on_v_sync_changed():
	_update_v_sync()


func _on_music_volume_db_changed():
	_update_music_volume()





func _update_fullscreen():
	OS.window_fullscreen = options_editor.fullscreen


func _update_v_sync():
	OS.set_use_vsync(options_editor.v_sync)



func _update_music_volume():
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), options_editor.music_volume_db)






func _on_FullscreenOptionCheckBox_toggled(button_pressed):
	options_editor.set_fullscreen(button_pressed)



func _on_VSyncOptionCheckBox_toggled(button_pressed):
	options_editor.set_v_sync(button_pressed)



func _on_SmoothCameraOptionCheckBox_toggled(button_pressed):
	options_editor.set_smooth_camera(button_pressed)


func _on_HidePetOptionCheckBox_toggled(button_pressed):
	pass # Replace with function body.



func _on_MusicOptionHSlider_value_changed(value):
	options_editor.set_music_volume_db(linear2db(value * 0.01))
