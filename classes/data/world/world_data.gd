class_name WorldData
extends DataResource





export(Resource) var local_player_body_data = local_player_body_data as PlayerBodyData setget _local_player_body_data


export(bool) var played setget _played




func _local_player_body_data(value):
	if not DataLoader.finished:
		local_player_body_data = value



func _played(value):
	if not DataLoader.finished:
		played = value



