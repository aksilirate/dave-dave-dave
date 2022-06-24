tool
class_name DataResource
extends Resource



func _init():
	connect("changed", self, "_on_changed")

func _on_changed():
	ResourceSaver.save(get_path(), self)
