class_name SecondJumpEditor
extends SecondJumpData



func add_to_overlapping_bodies(value):
	overlapping_bodies.push_back(value)
	emit_signal("overlapping_bodies_changed")
	emit_changed()



func remove_from_overlapping_bodies(value):
	overlapping_bodies.erase(value)
	emit_signal("overlapping_bodies_changed")
	emit_changed()
