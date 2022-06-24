class_name Bullet
extends Area2D


var direction: Vector2
var speed: float



func _physics_process(delta):
	global_position += direction * speed


