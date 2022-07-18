extends Node


onready var achievements: Achievements = $Achievements

var steam_id: int


func _ready() -> void:
	_initialize_steam()
	if not is_owned():
		print("Game is not owned.")
		get_tree().quit()
	
	
	steam_id = Steam.getSteamID()




func _process(_delta: float) -> void:
	Steam.run_callbacks()
	

func _initialize_steam() -> void:
	var init: Dictionary = Steam.steamInit(false)
	print("Did Steam initialize?: "+str(init))
	if init['status'] != 1:
		print("Failed to initialize Steam. "+str(init['verbal'])+" Shutting down...")





func is_owned() -> bool:
	return Steam.isSubscribed()









func get_user_path() -> String:
	var app_id: int = 1625760
	if OS.has_feature("playtest"):
		app_id = 2076960
	var path: String = Steam.getAppInstallDir(app_id)
	path = path.replace("\\", "/")
	return path
