class_name OptionsData
extends DataResource


signal fullscreen_changed


export(bool) var fullscreen setget _fullscreen

export(float) var music_volume_db = 1.0 setget _music_volume_db




func _fullscreen(value):
	if not Game:
		fullscreen = value


func _music_volume_db(_value):
	return
