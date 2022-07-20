extends Area2D


onready var achievement_area_editor = DataLoader.achievement_area_data as AchievementAreaEditor

export(String) var achievement_to_unlock






func _on_AchievementArea_body_entered(_body):
	if achievement_to_unlock == "":
		return
	achievement_area_editor.set_achievement_to_unlock(achievement_to_unlock)
	achievement_area_editor.emit_signal("activated")
