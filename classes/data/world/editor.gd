class_name WorldEditor
extends WorldData






func add_to_activated_checkpoints(value):
	if not activated_checkpoints.has(value):
		activated_checkpoints.push_back(value)
		emit_signal("activated_checkpoints_changed")
		emit_changed()



func set_activated_checkpoints(value):
	activated_checkpoints = value
	emit_signal("activated_checkpoints_set")
	emit_changed()



func set_played(value):
	played = value
	emit_changed()

