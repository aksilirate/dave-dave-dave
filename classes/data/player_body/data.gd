class_name PlayerBodyData
extends DataResource

signal play_time_changed
signal haste_changed


export(float) var play_time setget _play_time

export(float) var haste setget _haste 

export(int) var deaths setget _deaths




func _play_time(_value):
	print(_value)
	return

func _haste(_value):
	print(_value)
	return


func _deaths(_value):
	print(_value)
	return
