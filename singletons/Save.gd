extends Node

#var path: String = "user://save.cfg"
#var config = ConfigFile.new()
#
#
#func _ready():
#	if Globals.steamworks_loaded and Steamworks.is_owned():
#		path = Steamworks.get_user_path() + "/GameData/save.cfg"
#
#	config.load(path)
#
#func exists() -> bool:
#	var file = File.new()
#	return file.file_exists(path)
#
## Saving
#func set_player_deaths(player_deaths: int) -> void:
#	config.set_value("player", "deaths", player_deaths)
#
#func set_player_time(player_time: float) -> void:
#	config.set_value("player", "time", player_time)
#
#func set_player_double_jump(double_jump: bool) -> void:
#	config.set_value("player", "double_jump", double_jump)
#
#func set_player_crown(crown: bool) -> void:
#	config.set_value("player", "crown", crown)
#
#func set_player_global_position(player_global_position: Vector2) -> void:
#	config.set_value("player", "global_position", player_global_position)
#
#func set_player_inventory(player_inventory: Array) -> void:
#	config.set_value("player", "inventory", player_inventory)
#
#
#func set_player_diamonds_collected(diamonds_collected: int) -> void:
#	config.set_value("player", "diamonds_collected", diamonds_collected)
#
#
#func set_deactivated_checkpoints_paths(deactivated_checkpoints_paths: Array) -> void:
#	config.set_value("game", "deactivated_checkpoints_paths", deactivated_checkpoints_paths)
#
#
#func set_active_checkpoint_path(active_checkpoint_path: String) -> void:
#	config.set_value("game", "active_checkpoint_path", active_checkpoint_path)
#
#
#func set_deleted_nodes_paths(deleted_nodes_paths: Array) -> void:
#	config.set_value("game", "deleted_nodes_paths", deleted_nodes_paths)
#
#func set_pet_unlocked(pet_unlocked: bool) -> void:
#	config.set_value("game", "pet_unlocked", pet_unlocked)
#
#func set_pet_color(pet_color: Color) -> void:
#	config.set_value("game", "pet_color", pet_color)
#
#func set_pet_texture_path(pet_texture_path: String) -> void:
#	config.set_value("game", "pet_texture_path", pet_texture_path)
#
#
## Getting
#func get_player_deaths() -> int:
#	if config.load(path) != OK:
#		return 0
#	return config.get_value("player", "deaths")
#
#func get_player_time() -> float:
#	if config.load(path) != OK:
#		return 0.0
#	return config.get_value("player", "time")
#
#func get_player_double_jump() -> bool:
#	if config.load(path) != OK:
#		return false
#	return config.get_value("player", "double_jump", false)
#
#
#func get_player_crown() -> bool:
#	if config.load(path) != OK:
#		return false
#	return config.get_value("player", "crown", false)
#
#func get_player_global_position() -> Vector2:
#	if config.load(path) != OK:
#		return Vector2.ZERO
#	return config.get_value("player", "global_position")
#
#func get_player_inventory() -> Array:
#	if config.load(path) != OK:
#		return []
#
#	return config.get_value("player", "inventory")
#
#
#func get_player_diamonds_collected() -> int:
#	if config.load(path) != OK:
#		return 0
#
#	return config.get_value("player", "diamonds_collected")
#
#
#
#func get_deactivated_checkpoints_paths() -> Array:
#	if config.load(path) != OK:
#		return []
#
#	return config.get_value("game", "deactivated_checkpoints_paths")
#
#
#func get_active_checkpoint_path() -> String:
#	if config.load(path) != OK:
#		return ""
#
#	return config.get_value("game", "active_checkpoint_path", "")
#
#
#func get_deleted_nodes_paths() -> Array:
#	if config.load(path) != OK:
#		return []
#
#	return config.get_value("game", "deleted_nodes_paths")
#
#
#func get_pet_unlocked() -> bool:
#	if config.load(path) != OK:
#		return false
#
#	return config.get_value("game", "pet_unlocked", false)
#
#
#func get_pet_color() -> Color:
#	if config.load(path) != OK:
#		return Color.white
#
#	return config.get_value("game", "pet_color", Color.white)
#
#
#func get_pet_texture_path() -> String:
#	if config.load(path) != OK:
#		return ""
#
#	return config.get_value("game", "pet_texture_path", "")
#
#
#func write():
#	config.save(path)
#
#func delete():
#	var dir = Directory.new()
#	dir.remove(path)
