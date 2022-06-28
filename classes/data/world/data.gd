class_name WorldData
extends DataResource





export(Resource) var player_body_data = player_body_data as PlayerBodyData setget _player_body_data


export(bool) var played setget _played




func _player_body_data(value):
	if not DataLoader.finished:
		player_body_data = value



func _played(value):
	if not DataLoader.finished:
		played = value



