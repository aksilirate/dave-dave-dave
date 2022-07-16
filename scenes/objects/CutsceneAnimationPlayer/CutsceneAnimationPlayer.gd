class_name CutsceneAnimationPlayer
extends AnimationPlayer


onready var finish_area_data: FinishAreaData = DataLoader.finish_area_data

onready var cutscene_animation_player_editor = DataLoader.cutscene_animation_player_data as CutsceneAnimationPlayerEditor



func _ready():
	finish_area_data.connect("activated", self, "_on_finish_area_activated")


func _on_finish_area_activated():
	play("finish")



func _on_CutsceneAnimationPlayer_animation_started(_anim_name):
	cutscene_animation_player_editor.set_playing(true)


func _on_CutsceneAnimationPlayer_animation_finished(_anim_name):
	cutscene_animation_player_editor.set_playing(false)


func _on_ClassicWorldScene_ready():
	play("start")
