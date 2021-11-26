class_name Save

const SAVE_PATH: String = "user://save.cfg"



static func exists() -> bool:
	var file = File.new()
	return file.file_exists(SAVE_PATH)

# Saving
static func set_player_global_position(player_global_position: Vector2) -> void:
	var config = ConfigFile.new()
	config.load(SAVE_PATH)
	config.set_value("player", "global_position", player_global_position)
	config.save(SAVE_PATH)

static func set_player_inventory(player_inventory: Array) -> void:
	var config = ConfigFile.new()
	config.load(SAVE_PATH)
	config.set_value("player", "inventory", player_inventory)
	config.save(SAVE_PATH)


static func set_deactivated_checkpoints_paths(deactivated_checkpoints_paths: Array) -> void:
	var config = ConfigFile.new()
	config.load(SAVE_PATH)
	config.set_value("game", "deactivated_checkpoints_paths", deactivated_checkpoints_paths)
	config.save(SAVE_PATH)
	

static func set_active_checkpoint_path(active_checkpoint_path: String) -> void:
	var config = ConfigFile.new()
	config.load(SAVE_PATH)
	config.set_value("game", "active_checkpoint_path", active_checkpoint_path)
	config.save(SAVE_PATH)



# Getting
static func get_player_global_position() -> Vector2:
	var config = ConfigFile.new()
	if config.load(SAVE_PATH) != OK:
		return Vector2.ZERO

	return config.get_value("player", "global_position")
	
static func get_player_inventory() -> Array:
	var config = ConfigFile.new()
	if config.load(SAVE_PATH) != OK:
		return []

	return config.get_value("player", "inventory")
	
static func get_deactivated_checkpoints_paths() -> Array:
	var config = ConfigFile.new()
	if config.load(SAVE_PATH) != OK:
		return []

	return config.get_value("game", "deactivated_checkpoints_paths")
	
	
static func get_active_checkpoint_path() -> String:
	var config = ConfigFile.new()
	if config.load(SAVE_PATH) != OK:
		return ""

	return config.get_value("game", "active_checkpoint_path")

static func delete():
	var dir = Directory.new()
	dir.remove(SAVE_PATH)
