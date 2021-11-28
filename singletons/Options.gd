extends Node

signal music_volume_updated(arg_volume_db)
signal sfx_volume_updated(volume_percentage)

const PATH: String = "user://options.cfg"




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


func set_music_volume_db(volume_db):
	var config = ConfigFile.new()
	config.load(PATH)
	config.set_value("audio", "music_volume_db", volume_db)
	config.save(PATH)
	emit_signal("music_volume_updated", volume_db)


func set_sfx_volume_percentage(volume_percentage):
	var config = ConfigFile.new()
	config.load(PATH)
	config.set_value("audio", "volume_percentage", volume_percentage)
	config.save(PATH)
	emit_signal("sfx_volume_updated", volume_percentage)
	

# Getting
func get_fullscreen() -> bool:
	var config = ConfigFile.new()
	if config.load(PATH) != OK:
		return false
	return config.get_value("video", "fullscreen")
	
func get_music_volume_db() -> float:
	var config = ConfigFile.new()
	if config.load(PATH) != OK:
		return 0.0
	return config.get_value("audio", "music_volume_db", 0)

func get_sfx_volume_percentage() -> float:
	var config = ConfigFile.new()
	if config.load(PATH) != OK:
		return 0.0
	return config.get_value("audio", "volume_percentage", 1.0)


func delete():
	var dir = Directory.new()
	dir.remove(PATH)
