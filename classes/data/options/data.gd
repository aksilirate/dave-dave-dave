class_name OptionsData
extends DataResource


signal fullscreen_changed
signal v_sync_changed 
signal smooth_camera_changed


export(bool) var fullscreen setget _fullscreen

export(bool) var v_sync = true setget _v_sync

export(bool) var smooth_camera = true setget _smooth_camera

export(bool) var hide_pet = false setget _hide_pet

export(bool) var interface_selection = false setget _interface_selection


export(float) var music_volume_db setget _music_volume_db

export(float) var sfx_volume_db setget _sfx_volume_db



func _fullscreen(_value):
	return

func _v_sync(_value):
	return

func _smooth_camera(_value):
	return


func _hide_pet(_value):
	return


func _interface_selection(_value):
	return


func _music_volume_db(_value):
	return


func _sfx_volume_db(_value):
	return
