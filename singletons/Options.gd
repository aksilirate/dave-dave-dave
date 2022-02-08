extends Node

signal music_volume_updated(arg_volume_db)
signal sfx_volume_updated(volume_percentage)

signal d_pad_updated
signal smooth_camera_updated
signal hide_pet_updated
signal enable_selection_updated
signal v_sync_updated

var path: String = "user://options.cfg"
var config_file = ConfigFile.new()


func _ready():
# warning-ignore:return_value_discarded
	get_tree().connect("node_added", self, "_on_tree_node_added")
	if Globals.steamworks_loaded and Steamworks.is_owned():
		path = Steamworks.get_user_path() + "/GameData/options.cfg"
	config_file.load(path)
	
	
	OS.set_use_vsync(get_v_sync())
	
	if exists():
		OS.window_fullscreen = get_fullscreen()
		
	
	
	for button in get_tree().get_nodes_in_group("buttons"):
		button.focus_mode = Control.FOCUS_NONE
		if get_enable_selection():
			button.focus_mode = Control.FOCUS_ALL


func _on_tree_node_added(node: Node):
	if node.is_in_group("buttons"):
		node.focus_mode = Control.FOCUS_NONE
		if get_enable_selection():
			node.focus_mode = Control.FOCUS_ALL
	

func exists() -> bool:
	var file = File.new()
	return file.file_exists(path)


func set_fullscreen(fullscreen: bool) -> void:
	config_file.set_value("video", "fullscreen", fullscreen)
	config_file.save(path)


func set_music_volume_db(volume_db):
	config_file.set_value("audio", "music_volume_db", volume_db)
	config_file.save(path)
	emit_signal("music_volume_updated", volume_db)


func set_sfx_volume_percentage(volume_percentage):
	config_file.set_value("audio", "volume_percentage", volume_percentage)
	config_file.save(path)
	emit_signal("sfx_volume_updated", volume_percentage)

func set_d_pad(d_pad: bool) -> void:
	config_file.set_value("controls", "d_pad", d_pad)
	config_file.save(path)
	emit_signal("d_pad_updated")

func set_smooth_camera(smooth_camera: bool) -> void:
	config_file.set_value("camera", "smooth_camera", smooth_camera)
	config_file.save(path)
	emit_signal("smooth_camera_updated")

func set_hide_pet(hide_pet: bool) -> void:
	config_file.set_value("pet", "hide_pet", hide_pet)
	config_file.save(path)
	emit_signal("hide_pet_updated")


func set_enable_selection(enable_selection: bool) -> void:
	config_file.set_value("controls", "enable_selection", enable_selection)
	config_file.save(path)
	emit_signal("enable_selection_updated")
	
	for button in get_tree().get_nodes_in_group("buttons"):
		button.focus_mode = Control.FOCUS_NONE
		if get_enable_selection():
			button.focus_mode = Control.FOCUS_ALL


func set_v_sync(v_sync: bool) -> void:
	config_file.set_value("video", "v_sync", v_sync)
	config_file.save(path)
	
	OS.set_use_vsync(v_sync)
	emit_signal("v_sync_updated")




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
	
func get_d_pad() -> bool:
	var config = ConfigFile.new()
	if config.load(path) != OK:
		return false
	return config.get_value("controls", "d_pad", false)


func get_smooth_camera() -> bool:
	var config = ConfigFile.new()
	if config.load(path) != OK:
		return true
	return config.get_value("camera", "smooth_camera", true)

func get_hide_pet() -> bool:
	var config = ConfigFile.new()
	if config.load(path) != OK:
		return false
	return config.get_value("pet", "hide_pet", false)


func get_enable_selection() -> bool:
	var config = ConfigFile.new()
	if config.load(path) != OK:
		return false
	return config.get_value("controls", "enable_selection", false)



func get_v_sync() -> bool:
	var config = ConfigFile.new()
	if config.load(path) != OK:
		return false
	return config.get_value("video", "v_sync", true)


func delete():
	var dir = Directory.new()
	dir.remove(path)
