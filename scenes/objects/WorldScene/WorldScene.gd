class_name WorldScene
extends Node2D


var _world_editor: WorldEditor
var world_data: WorldData


export(bool) var new_game




func _ready():
	_world_editor.checkpoint_data.connect("activated", self, "_on_checkpoint_activated")
	_world_editor.set_played(true)



func _on_checkpoint_activated():
	_world_editor.add_to_activated_checkpoints(_world_editor.checkpoint_data.last_collided_position)
