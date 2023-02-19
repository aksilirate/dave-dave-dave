class_name OptionsManager
extends Node


onready var options_editor = DataLoader.options_data as OptionsEditor

onready var option_check_box_data: OptionCheckBoxData = DataLoader.option_check_box_data
onready var option_h_slider_data: OptionHSliderData = DataLoader.option_h_slider_data

var _signal




func _ready():
	_signal = options_editor.connect("music_volume_db_changed", self, "_on_music_volume_db_changed")
	_signal = option_check_box_data.connect("fullscreen_pressed_changed", self, "_on_fullscreen_pressed_changed")
	_signal = option_check_box_data.connect("v_sync_pressed_changed", self, "_on_v_sync_pressed_changed")
	_signal = option_check_box_data.connect("smooth_camera_pressed_changed", self, "_on_smooth_camera_pressed_changed")
	_signal = option_check_box_data.connect("interface_selection_pressed_changed", self, "_on_interface_selection_pressed_changed")
	_signal = option_h_slider_data.connect("music_option_h_slider_value_changed", self, "_on_music_option_h_slider_value_changed")
	_signal = option_h_slider_data.connect("sfx_option_h_slider_value_changed", self, "_on_sfx_option_h_slider_value_changed")
	_update_fullscreen()
	_update_v_sync()
	_update_music_volume()
	_update_sfx_volume()





func _on_music_volume_db_changed():
	_update_music_volume()




func _on_fullscreen_pressed_changed():
	options_editor.set_fullscreen(option_check_box_data.fullscreen_pressed)
	_update_fullscreen()




func _on_v_sync_pressed_changed():
	options_editor.set_v_sync(option_check_box_data.v_sync_pressed)
	_update_v_sync()



func _on_smooth_camera_pressed_changed():
	options_editor.set_smooth_camera(option_check_box_data.smooth_camera_pressed)


func _on_interface_selection_pressed_changed():
	options_editor.set_interface_selection(option_check_box_data.interface_selection_pressed)




func _on_music_option_h_slider_value_changed():
	options_editor.set_music_volume_db(linear2db(option_h_slider_data.music_option_h_slider_value * 0.01))
	_update_music_volume()




func _on_sfx_option_h_slider_value_changed():
	options_editor.set_sfx_volume_db(linear2db(option_h_slider_data.sfx_option_h_slider_value * 0.01))
	_update_sfx_volume()





func _update_fullscreen():
	OS.window_fullscreen = options_editor.fullscreen


func _update_v_sync():
	OS.set_use_vsync(options_editor.v_sync)



func _update_music_volume():
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), options_editor.music_volume_db)


func _update_sfx_volume():
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), options_editor.sfx_volume_db)

