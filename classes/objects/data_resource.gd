class_name DataResource
extends Resource




func _init():
	# warning-ignore:return_value_discarded
	connect("changed", self, "_on_changed")



static func init_data(arg_path: String, editor: Resource) -> Resource:
	var directory = Directory.new()
	if not directory.file_exists(arg_path):
		var _err = ResourceSaver.save(arg_path, editor)
	return ResourceLoader.load(arg_path)



func _on_changed():
	var _err = ResourceSaver.save(get_path(), self)
