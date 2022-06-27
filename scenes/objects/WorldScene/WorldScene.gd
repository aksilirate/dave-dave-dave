class_name WorldScene
extends Node2D


export(Resource) var _world_editor = _world_editor as WorldEditor setget set_world_editor

var world_data: WorldData



export(bool) var new_game



func set_world_editor(value):
	_world_editor = value
	world_data = _world_editor as WorldData



func _ready():
	if new_game:
		pass
