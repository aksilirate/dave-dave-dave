extends Node



func _ready() -> void:
	_initialize_steam()
	if not is_owned():
		set_process(false)



func _process(_delta: float) -> void:
	Steam.run_callbacks()


func _initialize_steam() -> void:
	var init: Dictionary = Steam.steamInit(false)
	print("Did Steam initialize?: "+str(init))
	if init['status'] != 1:
		print("Failed to initialize Steam. "+str(init['verbal'])+" Shutting down...")

	var dir = Directory.new()
	dir.open(get_user_path())
	dir.make_dir("GameData")


func is_owned() -> bool:
	return Steam.isSubscribed()



func unlock_achievement(name: String):
	if is_owned():
# warning-ignore:return_value_discarded
		Steam.setAchievement(name)
# warning-ignore:return_value_discarded
		Steam.storeStats()



func get_user_path() -> String:
	var path: String = Steam.getAppInstallDir(1625760)
	path = path.replace("\\", "/")
	return path
