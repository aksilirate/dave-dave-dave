class_name WorldEditor
extends WorldData



func set_played(value):
	played = value
	emit_changed()


func set_last_second_jumped_body(value):
	last_second_jumped_body = value
	emit_signal("last_second_jumped_body_set")
	emit_changed()
