class_name OptionsData
extends DataResource


signal fullscreen_changed
signal v_sync_changed 
signal smooth_camera_changed
signal hide_pet_changed
signal music_volume_db_changed


export(bool) var fullscreen setget _fullscreen

export(bool) var v_sync = true setget _v_sync

export(bool) var smooth_camera = true setget _smooth_camera

export(bool) var hide_pet = false setget _hide_pet

export(bool) var interface_selection = false setget _interface_selection


export(float) var music_volume_db setget _music_volume_db

export(float) var sfx_volume_db setget _sfx_volume_db



func _fullscreen(value):
	if not DataLoader.finished:
		fullscreen = value



func _v_sync(value):
	if not DataLoader.finished:
		v_sync = value



func _smooth_camera(value):
	if not DataLoader.finished:
		smooth_camera = value


func _hide_pet(value):
	if not DataLoader.finished:
		hide_pet = value


func _interface_selection(value):
	if not DataLoader.finished:
		interface_selection = value


func _music_volume_db(value):
	if not DataLoader.finished:
		music_volume_db = value


func _sfx_volume_db(value):
	if not DataLoader.finished:
		sfx_volume_db = value
