extends Node

signal music_volume_updated

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


func set_music_volume_db(value_db):
	var config = ConfigFile.new()
	config.load(PATH)
	config.set_value("audio", "music_volume_db", value_db)
	config.save(PATH)
	music_volume_db = value_db
	emit_signal("music_volume_updated")


# Getting
func get_fullscreen() -> bool:
	var config = ConfigFile.new()
	if config.load(PATH) != OK:
		return false

	return config.get_value("video", "fullscreen")


func delete():
	var dir = Directory.new()
	dir.remove(PATH)
