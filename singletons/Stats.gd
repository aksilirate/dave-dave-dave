extends Node

const PATH: String = "user://stats.cfg"
var config = ConfigFile.new()



func _ready():
	config.load(PATH)

func exists() -> bool:
	var file = File.new()
	return file.file_exists(PATH)
	
	
func set_deaths(deaths: int) -> void:
	config.set_value("stats", "deaths", deaths)


func set_time(time: float) -> void:
	config.set_value("stats", "time", time)


func get_deaths() -> int:
	if config.load(PATH) != OK:
		return 0
	return config.get_value("stats", "deaths")
	
func get_time() -> float:
	if config.load(PATH) != OK:
		return 0.0
	return config.get_value("stats", "time")
	
	
func write():
	config.save(PATH)
