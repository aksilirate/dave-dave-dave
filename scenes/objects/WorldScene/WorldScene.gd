class_name WorldScene
extends Node2D


var _world_editor: WorldEditor
var world_data: WorldData


export(bool) var new_game




func _ready():
	_world_editor.set_played(true)

