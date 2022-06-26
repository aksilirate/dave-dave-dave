class_name WorldData
extends DataResource


signal last_second_jumped_body_set

export(Resource) var player_body_data = player_body_data as PlayerBodyData setget _player_body_data

export(bool) var played setget _played




var last_second_jumped_body setget _last_second_jumped_body







func _player_body_data(_value):
	return



func _played(value):
	if not DataLoader:
		played = value



func _last_second_jumped_body(_value):
	return


