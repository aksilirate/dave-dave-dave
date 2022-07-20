class_name CutsceneAnimationPlayer
extends AnimationPlayer


onready var current_game_state: WorldGameState = DataLoader.game_state_data.current_game_state as WorldGameState
onready var world_data = current_game_state.world_data as WorldData
onready var local_player_data = world_data.local_player_body_data as PlayerBodyData
onready var finish_area_data: FinishAreaData = DataLoader.finish_area_data
onready var cutscene_animation_player_editor = DataLoader.cutscene_animation_player_data as CutsceneAnimationPlayerEditor


func _ready():
	world_data.connect("completed_changed", self, "_on_world_completed_changed")



func _on_world_completed_changed():
	if local_player_data.deaths < 1000:
		play("finish_cyan")
		return
	play("finish_red")




func _on_CutsceneAnimationPlayer_animation_started(_anim_name):
	cutscene_animation_player_editor.set_playing(true)



func _on_CutsceneAnimationPlayer_animation_finished(_anim_name):
	cutscene_animation_player_editor.set_playing(false)



func _on_ClassicWorldScene_ready():
	if current_game_state.reset_data:
		play("start")
		return
	cutscene_animation_player_editor.set_playing(false)


func _on_LockedDoor28_item_removed():
	play("gray_dave_suicide")
