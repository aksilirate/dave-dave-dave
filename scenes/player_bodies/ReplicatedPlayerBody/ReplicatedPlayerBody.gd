class_name ReplicatedPlayerBody
extends PlayerBody



var id: int



func _ready():
	player_body_editor = world_scene.world_data.online_player_bodies_data[id]
	emit_signal("player_body_editor_set")
