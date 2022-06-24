class_name PlayerBodyEditor
extends PlayerBodyData





func set_last_second_jumped_player_body(value):
	last_second_jumped_player_body = value
	emit_signal("last_second_jumped_player_body_set")
	emit_changed()
