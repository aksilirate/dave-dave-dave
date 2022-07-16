class_name FinishAreaData
extends DataResource


signal activated



var entered_body: Node2D setget _entered_body





func _entered_body(value):
	if not DataLoader.finished:
		entered_body = value

