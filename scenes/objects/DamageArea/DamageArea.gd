class_name DamageArea
extends Area2D


onready var damage_area_editor = DataLoader.damage_area_data as DamageAreaEditor


onready var area_collision_shape = $CollisionShape2D
onready var static_body_collision_shape = $StaticBody2D/CollisionShape2D



func _ready():
	static_body_collision_shape.position = area_collision_shape.position
	static_body_collision_shape.shape.extents = area_collision_shape.shape.extents
	static_body_collision_shape.shape.extents -= Vector2(0.5, 0.5)



func _on_DamageArea_body_entered(body):
	damage_area_editor.set_entered_body(body)
