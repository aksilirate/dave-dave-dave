class_name WorldScene
extends Node2D


export(Resource) var _world_editor = _world_editor as WorldEditor setget set_world_editor

var world_data: WorldData



export(bool) var new_game




func set_world_editor(value):
	_world_editor = value
	world_data = _world_editor as WorldData



func _ready():
	_world_editor.checkpoint_data.connect("activated", self, "_on_checkpoint_activated")
	_world_editor.set_played(true)



func _on_checkpoint_activated():
	_world_editor.add_to_activated_checkpoints(_world_editor.checkpoint_data.last_collided_position)
