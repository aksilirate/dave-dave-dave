class_name WorldData
extends DataResource


signal last_second_jumped_body_set


export(bool) var played setget _played

export(Resource) var player_body_data = PlayerBodyEditor.new() as PlayerBodyData




var last_second_jumped_body setget _last_second_jumped_body



func _played(_value):
	return


func _last_second_jumped_body(_value):
	return
