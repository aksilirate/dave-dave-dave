class_name WorldData
extends DataResource


signal activated_checkpoints_set
signal activated_checkpoints_changed



export(Resource) var player_body_data = player_body_data as PlayerBodyData setget _player_body_data

export(Resource) var checkpoint_data = checkpoint_data as CheckpointData setget _checkpoint_data


export(Array) var activated_checkpoints: Array setget _activated_checkpoints


export(bool) var played setget _played



func _activated_checkpoints(value):
	if not DataLoader:
		activated_checkpoints = value


func _player_body_data(value):
	if not DataLoader:
		player_body_data = value


func _checkpoint_data(value):
	if not DataLoader:
		checkpoint_data = value


func _played(value):
	if not DataLoader:
		played = value



