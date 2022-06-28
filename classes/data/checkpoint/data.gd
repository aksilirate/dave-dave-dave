class_name CheckpointData
extends DataResource

signal activated

signal last_collided_body_set
signal last_collided_body_changed

signal last_collided_position_set
signal last_collided_position_changed




var last_collided_body: Node2D setget _last_collided_body

export(Vector2) var last_collided_position: Vector2 setget _last_collided_position





func _last_collided_body(value):
	if not DataLoader.finished:
		last_collided_body = value


func _last_collided_position(value):
	if not DataLoader.finished:
		last_collided_position = value
