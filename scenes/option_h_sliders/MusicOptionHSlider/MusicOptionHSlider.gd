extends OptionHSlider



var _signal


func _ready():
	_signal = options_data.connect("music_volume_db_changed", self, "_on_music_volume_db_changed")



func _on_music_volume_db_changed():
	_update_slider()


func _update_slider():
	value = db2linear(options_data.music_volume_db) * 100.0
