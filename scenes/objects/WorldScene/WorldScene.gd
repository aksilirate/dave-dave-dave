class_name WorldScene
extends Node2D


export(Resource) var world_editor = world_editor as WorldEditor setget _world_editor

var world_data: WorldData

export(NodePath) onready var controllable_player_body = get_node(controllable_player_body) as ControllablePlayerBody


export(bool) var new_game



func _world_editor(value):
	world_editor = value
	world_data = world_editor as WorldData



func _ready():
	controllable_player_body.connect("second_jumped", self, "_on_player_body_second_jumped")
	if new_game:
		pass


func _on_player_body_second_jumped():
	world_editor.set_last_second_jumped_body(controllable_player_body)
