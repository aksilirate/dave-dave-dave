class_name OptionHSliderEditor
extends OptionHSliderData






func set_music_option_h_slider_value(value):
	music_option_h_slider_value = value
	emit_signal("music_option_h_slider_value_changed")



func set_sfx_option_h_slider_value(value):
	sfx_option_h_slider_value = value
	emit_signal("sfx_option_h_slider_value_changed")
