class_name PlayerBodyData
extends DataResource

signal play_time_changed
signal haste_changed


export(float) var play_time setget _play_time

export(float) var haste setget _haste 

export(int) var deaths setget _deaths




func _play_time(value):
	if not Game:
		play_time = value

func _haste(value):
	if not Game:
		haste = value


func _deaths(value):
	if not Game:
		deaths = value
