extends OptionHSlider





func _ready():
	value = db2linear(options_data.sfx_volume_db) * 100.0







func _on_SFXOptionHSlider_value_changed(value):
	option_h_slider_editor.set_sfx_option_h_slider_value(value)
