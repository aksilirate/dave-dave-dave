class_name DamageAreaEditor
extends DamageAreaData



func set_entered_body(value):
	if value != entered_body:
		entered_body = value
		emit_signal("collided_body_changed")
	emit_signal("collided_body_set")
