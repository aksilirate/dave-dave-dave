class_name WorldScene
extends Node2D


export(NodePath) onready var player_body = get_node(player_body) as PlayerBody

onready var world_editor: WorldEditor = Game.current_world_data as WorldEditor



func _ready():
	player_body.connect("second_jumped", self, "_on_player_body_second_jumped")



func _on_player_body_second_jumped():
	world_editor.set_last_second_jumped_body(player_body)
