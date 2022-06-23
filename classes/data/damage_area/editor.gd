class_name DamageAreaEditor
extends DamageAreaData



func set_last_collided_body(value):
	if value != last_collided_body:
		last_collided_body = value
		emit_signal("last_collided_body_changed")
		emit_changed()
	emit_signal("last_collided_body_set")
