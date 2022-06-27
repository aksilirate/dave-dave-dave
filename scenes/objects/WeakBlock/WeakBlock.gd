extends StaticBody2D

onready var rebuild_timer = $RebuildTimer
onready var collision_shape = $CollisionShape2D
onready var area_collision_shape = $Area2D/CollisionShape2D
onready var animation_player = $AnimationPlayer
onready var sprite = $Sprite


func disable() -> void:
	collision_shape.set_deferred("disabled", true)
	area_collision_shape.set_deferred("disabled", true)
	rebuild_timer.start()

func enable() -> void:
	collision_shape.set_deferred("disabled", false)
	area_collision_shape.set_deferred("disabled", false)
	sprite.frame = 0
	sprite.show()

func _on_Area2D_body_entered(body):
	animation_player.play("destruction")


func _on_RebuildTimer_timeout():
	enable()

