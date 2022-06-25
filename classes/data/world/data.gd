class_name WorldData
extends DataResource


signal last_second_jumped_body_set


export(Resource) var player_body_data = PlayerBodyData.new()



var last_second_jumped_body setget _last_second_jumped_body



func _last_second_jumped_body(_value):
	return
