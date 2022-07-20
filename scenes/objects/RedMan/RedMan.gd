class_name RedMan
extends Sprite

signal died

onready var current_game_state: WorldGameState = DataLoader.game_state_data.current_game_state as WorldGameState

onready var animation_player = $AnimationPlayer

export(bool) var hide_on_continue




func _ready():
	if not current_game_state.reset_data:
		if hide_on_continue:
			hide()



func _play_animation(animation_name: String):
	animation_player.play(animation_name)


func _on_Area2D_area_entered(area: Node2D):
	animation_player.play("death")
	emit_signal("died")
	area.queue_free()


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "death":
		queue_free()
