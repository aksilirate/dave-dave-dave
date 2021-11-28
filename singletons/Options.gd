extends Node

const PATH: String = "user://options.cfg"

var music_volume_db: float
var sfx_volume_db: float



func _ready():
	if exists():
		OS.window_fullscreen = get_fullscreen()


func exists() -> bool:
	var file = File.new()
	return file.file_exists(PATH)


func set_fullscreen(fullscreen: bool) -> void:
	var config = ConfigFile.new()
	config.load(PATH)
	config.set_value("video", "fullscreen", fullscreen)
	config.save(PATH)



# Getting
func get_fullscreen() -> bool:
	var config = ConfigFile.new()
	if config.load(PATH) != OK:
		return false

	return config.get_value("video", "fullscreen")


func delete():
	var dir = Directory.new()
	dir.remove(PATH)
