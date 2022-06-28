class_name ItemAreaData
extends DataResource

signal item_collected

signal last_body_collected_item_set
signal last_collected_item_set
signal last_collected_item_position_set


onready var last_body_collected_item: Node2D setget _last_body_collected_item
onready var last_collected_item: String setget _last_collected_item
onready var last_collected_item_position: Vector2 setget _last_collected_item_position


func _last_body_collected_item(_value):
	return



func _last_collected_item(_value):
	return


func _last_collected_item_position(_value):
	return
