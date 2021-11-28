extends Node

const SAVE_PATH: String = "user://save.cfg"
var config = ConfigFile.new()


func exists() -> bool:
	var file = File.new()
	return file.file_exists(SAVE_PATH)

# Saving
func set_player_deaths(player_deaths: int) -> void:
	config.load(SAVE_PATH)
	config.set_value("player", "deaths", player_deaths)
	config.save(SAVE_PATH)

func set_player_time(player_time: float) -> void:
	config.load(SAVE_PATH)
	config.set_value("player", "time", player_time)
	config.save(SAVE_PATH)

func set_player_global_position(player_global_position: Vector2) -> void:
	config.load(SAVE_PATH)
	config.set_value("player", "global_position", player_global_position)
	config.save(SAVE_PATH)

func set_player_inventory(player_inventory: Array) -> void:
	config.load(SAVE_PATH)
	config.set_value("player", "inventory", player_inventory)
	config.save(SAVE_PATH)


func set_player_diamonds_collected(diamonds_collected: int) -> void:
	config.load(SAVE_PATH)
	config.set_value("player", "diamonds_collected", diamonds_collected)
	config.save(SAVE_PATH)


func set_deactivated_checkpoints_paths(deactivated_checkpoints_paths: Array) -> void:
	config.load(SAVE_PATH)
	config.set_value("game", "deactivated_checkpoints_paths", deactivated_checkpoints_paths)
	config.save(SAVE_PATH)
	

func set_active_checkpoint_path(active_checkpoint_path: String) -> void:
	config.load(SAVE_PATH)
	config.set_value("game", "active_checkpoint_path", active_checkpoint_path)
	config.save(SAVE_PATH)


func set_deleted_nodes_paths(deleted_nodes_paths: Array) -> void:
	config.load(SAVE_PATH)
	config.set_value("game", "deleted_nodes_paths", deleted_nodes_paths)
	config.save(SAVE_PATH)


# Getting
func get_player_deaths() -> int:
	if config.load(SAVE_PATH) != OK:
		return 0

	return config.get_value("player", "deaths")

func get_player_time() -> float:
	if config.load(SAVE_PATH) != OK:
		return 0.0

	return config.get_value("player", "time")

func get_player_global_position() -> Vector2:
	if config.load(SAVE_PATH) != OK:
		return Vector2.ZERO

	return config.get_value("player", "global_position")
	
func get_player_inventory() -> Array:
	if config.load(SAVE_PATH) != OK:
		return []

	return config.get_value("player", "inventory")


func get_player_diamonds_collected() -> int:
	if config.load(SAVE_PATH) != OK:
		return 0

	return config.get_value("player", "diamonds_collected")
	


func get_deactivated_checkpoints_paths() -> Array:
	if config.load(SAVE_PATH) != OK:
		return []

	return config.get_value("game", "deactivated_checkpoints_paths")
	
	
func get_active_checkpoint_path() -> String:
	if config.load(SAVE_PATH) != OK:
		return ""

	return config.get_value("game", "active_checkpoint_path")


func get_deleted_nodes_paths() -> Array:
	if config.load(SAVE_PATH) != OK:
		return []

	return config.get_value("game", "deleted_nodes_paths")


func delete():
	var dir = Directory.new()
	dir.remove(SAVE_PATH)
