extends Node



func _ready() -> void:
	_initialize_steam()
	if not is_owned():
		print("Game is not owned.")
		get_tree().quit()



func _process(_delta: float) -> void:
	Steam.run_callbacks()


func _initialize_steam() -> void:
	var init: Dictionary = Steam.steamInit(false)
	print("Did Steam initialize?: "+str(init))
	if init['status'] != 1:
		print("Failed to initialize Steam. "+str(init['verbal'])+" Shutting down...")






func _unlock_achievement(name: String):
	if is_owned():
# warning-ignore:return_value_discarded
		Steam.setAchievement(name)
# warning-ignore:return_value_discarded
		Steam.storeStats()







func is_owned() -> bool:
	return Steam.isSubscribed()









func get_user_path() -> String:
	var path: String = Steam.getAppInstallDir(1625760)
	path = path.replace("\\", "/")
	return path
