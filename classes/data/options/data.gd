class_name OptionsData
extends DataResource


signal fullscreen_changed
signal v_sync_changed 



export(bool) var fullscreen setget _fullscreen

export(bool) var v_sync = true setget _v_sync

export(float) var music_volume_db = 1.0 setget _music_volume_db




func _fullscreen(value):
	if not Game:
		fullscreen = value

func _v_sync(value):
	if not Game:
		v_sync = value


func _music_volume_db(_value):
	return
