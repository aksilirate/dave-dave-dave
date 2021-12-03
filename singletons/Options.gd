extends Node

signal music_volume_updated(arg_volume_db)
signal sfx_volume_updated(volume_percentage)

var path: String = "user://options.cfg"
var config = ConfigFile.new()


func _ready():
	if Steamworks.is_owned():
		path = Steamworks.get_user_path() + "/GameData/options.cfg"
	config.load(path)

	if exists():
		OS.window_fullscreen = get_fullscreen()


func exists() -> bool:
	var file = File.new()
	return file.file_exists(path)


func set_fullscreen(fullscreen: bool) -> void:
	config.set_value("video", "fullscreen", fullscreen)
	config.save(path)


func set_music_volume_db(volume_db):
	config.set_value("audio", "music_volume_db", volume_db)
	config.save(path)
	emit_signal("music_volume_updated", volume_db)


func set_sfx_volume_percentage(volume_percentage):
	config.set_value("audio", "volume_percentage", volume_percentage)
	config.save(path)
	emit_signal("sfx_volume_updated", volume_percentage)
	

# Getting
func get_fullscreen() -> bool:
	var config = ConfigFile.new()
	if config.load(path) != OK:
		return false
	return config.get_value("video", "fullscreen", false)
	
func get_music_volume_db() -> float:
	var config = ConfigFile.new()
	if config.load(path) != OK:
		return 1.0
	return config.get_value("audio", "music_volume_db", 0)

func get_sfx_volume_percentage() -> float:
	var config = ConfigFile.new()
	if config.load(path) != OK:
		return 1.0
	return config.get_value("audio", "volume_percentage", 1.0)


func delete():
	var dir = Directory.new()
	dir.remove(path)
