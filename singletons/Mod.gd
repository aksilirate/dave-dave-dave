extends Node





func _ready():
	var dir = Directory.new()
	if dir.open("user://") == OK:
		dir.make_dir("mods")
		dir.open("user://mods")
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if file_name.get_extension() == "pck":
				ProjectSettings.load_resource_pack("user://mods/" + file_name, true)
			file_name = dir.get_next()

