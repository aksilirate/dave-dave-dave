class_name Achievements
extends Node


var _signal




func _ready():
	DataLoader.connect("all_data_initialized", self, "_on_all_data_initialized")




func _on_all_data_initialized():
	var adventure_world_data = DataLoader.adventure_world_data as WorldData
	var adventure_local_player_body = adventure_world_data.local_player_body_data as PlayerBodyData
	
	
	_signal = adventure_local_player_body.connect("collected_diamonds_changed", self, "_on_collected_diamonds_changed")



func _on_collected_diamonds_changed():
	_unlock_achievement("FIRST_DIAMOND")





func _unlock_achievement(name: String):
	if Steamworks.is_owned():
# warning-ignore:return_value_discarded
		Steam.setAchievement(name)
# warning-ignore:return_value_discarded
		Steam.storeStats()
