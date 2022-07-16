extends OptionHSlider





func _ready():
	value = db2linear(options_data.music_volume_db) * 100.0







func _on_MusicOptionHSlider_value_changed(value):
	option_h_slider_editor.set_music_option_h_slider_value(value)
