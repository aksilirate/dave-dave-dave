class_name Achievements
extends Node




var adventure_world_data: WorldData
var adventure_local_player_body: PlayerBodyData
var diamond_data: DiamondData
var achievement_area_data: AchievementAreaData



var _success
var _signal




func _ready():
	_signal = DataLoader.connect("all_data_initialized", self, "_on_all_data_initialized")




func _on_all_data_initialized():
	adventure_world_data = DataLoader.adventure_world_data as WorldData
	adventure_local_player_body = adventure_world_data.local_player_body_data as PlayerBodyData
	diamond_data = DataLoader.diamond_data as DiamondData
	achievement_area_data = DataLoader.achievement_area_data as AchievementAreaData
	
	_signal = adventure_world_data.connect("completed_changed", self, "_on_adventure_world_completed_changed")
	_signal = adventure_local_player_body.connect("collected_diamonds_changed", self, "_on_collected_diamonds_changed")
	_signal = achievement_area_data.connect("activated", self, "_on_achievement_area_activated")



func _on_adventure_world_completed_changed():
	if adventure_world_data.completed:
		_unlock_achievement("FREEDOM_WAS_A_LIE")


func _on_collected_diamonds_changed():
	if adventure_local_player_body.collected_diamonds.size() >= 1:
		_unlock_achievement("FIRST_DIAMOND")
		
	if adventure_local_player_body.collected_diamonds.size() >= diamond_data.diamonds.size():
		_unlock_achievement("DIAMOND_RUSH")


func _on_achievement_area_activated():
	_unlock_achievement(achievement_area_data.achievement_to_unlock)



func _unlock_achievement(achievement_name: String):
	if Steamworks.is_owned():
		print(achievement_name + " is unlocked")
		_success = Steam.setAchievement(achievement_name)
		_success = Steam.storeStats()
