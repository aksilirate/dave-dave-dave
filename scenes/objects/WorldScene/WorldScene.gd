class_name WorldScene
extends Node2D


export(Resource) var world_editor = world_editor as WorldEditor setget _world_editor

var world_data: WorldData



export(bool) var new_game



func _world_editor(value):
	world_editor = value
	world_data = world_editor as WorldData



func _ready():
	if new_game:
		pass
