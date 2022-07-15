class_name RedMan
extends Sprite

signal died

onready var animation_player = $AnimationPlayer



func _play_animation(animation_name: String):
	animation_player.play(animation_name)


func _on_Area2D_area_entered(area: Node2D):
	animation_player.play("death")
	emit_signal("died")
	area.queue_free()


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "death":
		queue_free()
