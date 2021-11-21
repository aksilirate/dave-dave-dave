class_name HastePotion
extends Area2D


export(int) var haste_time 

onready var collision_shape = $CollisionShape2D
onready var respawn_timer = $RespawnTimer


func consume() -> void:
	Audio.play("res://assets/sounds/collect_haste_potion.wav")
	collision_shape.set_deferred("disabled", true)
	respawn_timer.start(haste_time)
	hide()
	
func respawn() -> void:
	collision_shape.set_deferred("disabled", false)
	show()


func _on_RespawnTimer_timeout():
	respawn()
