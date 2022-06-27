class_name Checkpoint
extends Area2D


export(NodePath) onready var world_scene = get_node(world_scene) as WorldScene

onready var checkpoint_editor = world_scene.world_data.checkpoint_data as CheckpointEditor



onready var sprite = $Sprite


var activated: bool


func _ready():
	world_scene.world_data.connect("activated_checkpoints_set", self, "_on_activated_checkpoints_set")
	checkpoint_editor.connect("last_collided_position_changed", self, "_on_checkpoint_last_collided_position_changed")
	_update_checkpoint()



func _on_activated_checkpoints_set():
	_update_checkpoint()




func _on_checkpoint_last_collided_position_changed():
	if not checkpoint_editor.last_collided_position == global_position:
		if activated:
			deactivate()




func _update_checkpoint():
	if checkpoint_editor.last_collided_position == global_position:
		activate()
		return
		
	if world_scene.world_data.activated_checkpoints.has(global_position):
		deactivate()
		return
		
	sprite.frame = 0



func activate():
	activated = true
	sprite.frame = 1
	
	

func deactivate():
	sprite.frame = 2



func _on_Checkpoint_body_entered(body):
	checkpoint_editor.set_last_collided_position(global_position)
	checkpoint_editor.set_last_collided_body(body)
	checkpoint_editor.emit_signal("activated")
	activate()
