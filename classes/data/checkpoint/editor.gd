class_name CheckpointEditor
extends CheckpointData





func set_last_collided_body(value):
	if value != last_collided_body:
		last_collided_body = value
		emit_signal("last_collided_body_changed")
		emit_changed()
	emit_signal("last_collided_body_set")





func set_last_collided_position(value):
	if value != last_collided_position:
		last_collided_position = value
		emit_signal("last_collided_position_changed")
		emit_changed()
	emit_signal("last_collided_position_set")
