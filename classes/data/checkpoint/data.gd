class_name CheckpointData
extends DataResource

signal activated



var entered_body: Node2D setget _entered_body

export(Vector2) var position: Vector2 setget _position





func _entered_body(value):
	if not DataLoader.finished:
		entered_body = value


func _position(value):
	if not DataLoader.finished:
		position = value
