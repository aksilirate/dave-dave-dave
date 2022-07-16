class_name OptionsManager
extends Node


onready var options_editor = DataLoader.options_data as OptionsEditor

onready var option_check_box_data: OptionCheckBoxData = DataLoader.option_check_box_data


var _signal




func _ready():
	_signal = options_editor.connect("music_volume_db_changed", self, "_on_music_volume_db_changed")
	_signal = option_check_box_data.connect("fullscreen_pressed_changed", self, "_on_fullscreen_pressed_changed")
	_signal = option_check_box_data.connect("v_sync_pressed_changed", self, "_on_v_sync_pressed_changed")
	_signal = option_check_box_data.connect("hide_pet_pressed_changed", self, "_on_hide_pet_pressed_changed")
	_update_fullscreen()
	_update_v_sync()
	_update_music_volume()






func _on_music_volume_db_changed():
	_update_music_volume()




func _on_fullscreen_pressed_changed():
	options_editor.set_fullscreen(option_check_box_data.fullscreen_pressed)
	_update_fullscreen()




func _on_v_sync_pressed_changed():
	options_editor.set_v_sync(option_check_box_data.v_sync_pressed)
	_update_v_sync()



func _on_hide_pet_pressed_changed():
	options_editor.set_hide_pet(option_check_box_data.hide_pet_pressed)





func _update_fullscreen():
	OS.window_fullscreen = options_editor.fullscreen


func _update_v_sync():
	OS.set_use_vsync(options_editor.v_sync)



func _update_music_volume():
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), options_editor.music_volume_db)




func _on_MusicOptionHSlider_value_changed(value):
	options_editor.set_music_volume_db(linear2db(value * 0.01))
