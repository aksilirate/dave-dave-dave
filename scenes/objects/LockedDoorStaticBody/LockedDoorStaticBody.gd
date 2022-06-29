extends StaticBody2D


onready var collision_shape = $CollisionShape2D



func _on_LockedDoor_item_removed():
	collision_shape.set_deferred("disabled", true)
