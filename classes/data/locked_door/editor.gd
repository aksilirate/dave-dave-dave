class_name LockedDoorEditor
extends LockedDoorData





func set_last_unlock_position(value):
	last_unlock_position = value
	emit_signal("last_unlock_position_set")
