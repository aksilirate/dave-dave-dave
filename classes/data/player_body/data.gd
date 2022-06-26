class_name PlayerBodyData
extends DataResource

signal second_jumped

signal play_time_changed
signal haste_changed
signal deaths_changed


export(float) var play_time setget _play_time

export(int) var diamonds_collected setget _diamonds_collected


export(float) var haste setget _haste 

export(int) var deaths setget _deaths

var body: Node2D



func _play_time(value):
	if not DataLoader:
		play_time = value


func _diamonds_collected(value):
	if not DataLoader:
		diamonds_collected = value


func _haste(_value):
	return


func _deaths(_value):
	return
