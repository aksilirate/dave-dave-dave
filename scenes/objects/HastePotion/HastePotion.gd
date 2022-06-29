class_name HastePotion
extends Area2D


onready var haste_potion_editor = DataLoader.haste_potion_data as HastePotionEditor


export(float) var haste_time 

onready var collision_shape = $CollisionShape2D
onready var respawn_timer = $RespawnTimer


func _ready():
	$AnimationPlayer.play("idle")

func consume() -> void:
#	Audio.play("res://assets/sounds/collect_haste_potion.wav")
	collision_shape.set_deferred("disabled", true)
	respawn_timer.start(haste_time)
	hide()





func respawn() -> void:
	collision_shape.set_deferred("disabled", false)
	show()


func _on_RespawnTimer_timeout():
	respawn()


func _on_HastePotion_body_entered(body):
	haste_potion_editor.set_collected_body(body)
	haste_potion_editor.set_haste_time(haste_time)
	haste_potion_editor.emit_signal("activated")
	consume()
