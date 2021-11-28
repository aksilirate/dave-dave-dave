extends HSlider




func _on_MusicHSlider_value_changed(value):
	Options.set_music_volume_db(linear2db(value * 0.01))
