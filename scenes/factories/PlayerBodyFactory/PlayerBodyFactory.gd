extends Node2D


export(NodePath) onready var world_scene = get_node(world_scene) as WorldScene

onready var spawn_position = $SpawnPosition

func _ready():
	print(Steam.getConnectedControllers())
	
	Steam.connect("input_action_event", self, "_on_input_action_event")
	
	for index in world_scene.world_data.local_player_bodies_data.size():
		var local_player_body = preload("res://scenes/player_bodies/LocalPlayerBody/LocalPlayerBody.tscn").instance()
		local_player_body.id = index
		local_player_body.world_scene = world_scene
		add_child(local_player_body)
		local_player_body.global_position = spawn_position.global_position
		if index:
			local_player_body.input_type = LocalPlayerBody.InputType.CONTROLLER



func _input(event):
	pass



func _on_input_configuration_loaded(a,s,d):
	print("asdddddd")



func _on_input_action_event(a, b, c):
	print("?ddd")
