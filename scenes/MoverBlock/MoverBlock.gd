class_name MoverBlock
extends Area2D

onready var sprite = $AnimatedSprite

export(int) var strength


func _ready():
	sprite.frame = 0


func get_velocity() -> Vector2:
	return Vector2.RIGHT.rotated(rotation) * strength
