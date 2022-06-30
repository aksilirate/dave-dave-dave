class_name WorldData
extends DataResource





export(Dictionary) var local_player_bodies_data: Dictionary setget _local_player_bodies_data


export(bool) var played setget _played




func _local_player_bodies_data(value):
	if not DataLoader.finished:
		local_player_bodies_data = value



func _played(value):
	if not DataLoader.finished:
		played = value



