extends Node


onready var animation_player = $AnimationPlayer

onready var checkpoints = $World/Checkpoints
onready var spikes = $World/Spikes

onready var player = $World/Player


var deactivated_checkpoints: Array = []

var active_checkpoint: Checkpoint


func _on_FreedomArea_body_entered(body):
	animation_player.play("end")


func _ready():
	for child in checkpoints.get_children():
		var checkpoint_node: Checkpoint = child
		checkpoint_node.connect("activated", self, "_on_checkpoint_activated", [checkpoint_node])
		
	for child in spikes.get_children():
		var spikes_node: Area2D = child
		spikes_node.connect("body_entered", self, "_on_spikes_body_entered")
	
	animation_player.play("first_scene")


func _on_checkpoint_activated(arg_checkpoint: Checkpoint):
	if active_checkpoint != arg_checkpoint:
		
		if active_checkpoint != null:
			active_checkpoint.deactivate()
		
		active_checkpoint = arg_checkpoint
		player.respawn_location = arg_checkpoint.global_position

func _on_spikes_body_entered(body):
	player.respawn()
