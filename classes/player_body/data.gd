class_name PlayerBodyData
extends DataResource

signal second_jumped

signal play_time_changed
signal haste_changed
signal deaths_changed
signal respawn_location_changed



export(float) var play_time setget _play_time

export(int) var diamonds_collected setget _diamonds_collected

export(bool) var double_jump setget _double_jump

export(float) var haste setget _haste 

export(int) var deaths setget _deaths

export(Vector2) var respawn_location setget _respawn_location


var body: Node2D



func _play_time(value):
	if not DataLoader:
		play_time = value


func _diamonds_collected(value):
	if not DataLoader:
		diamonds_collected = value


func _double_jump(value):
	if not DataLoader:
		double_jump = value


func _haste(value):
	if not DataLoader:
		haste = value


func _deaths(value):
	if not DataLoader:
		deaths = value

func _respawn_location(value):
	if not DataLoader:
		respawn_location = value
