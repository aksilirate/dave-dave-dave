class_name Checkpoint
extends Area2D


onready var current_game_state: WorldGameState = DataLoader.game_state_data.current_game_state as WorldGameState
onready var local_player_body_data: PlayerBodyData = current_game_state.world_data.local_player_body_data

onready var checkpoint_editor = DataLoader.checkpoint_data as CheckpointEditor



onready var sprite = $Sprite


var activated: bool


var _signal


func _ready():
	_signal = local_player_body_data.connect("activated_checkpoints_changed", self, "_on_activated_checkpoints_changed")
	checkpoint_editor.connect("activated", self, "_on_checkpoint_activated")
	_update_checkpoint()



func _on_activated_checkpoints_changed():
	_update_checkpoint()




func _on_checkpoint_activated():
	if not checkpoint_editor.position == global_position:
		if activated:
			deactivate()




func _update_checkpoint():
	if checkpoint_editor.position == global_position:
		activate()
		return
		
	if local_player_body_data.activated_checkpoints.has(global_position):
		deactivate()
		return
		
	sprite.frame = 0



func activate():
	activated = true
	sprite.frame = 1
	
	

func deactivate():
	sprite.frame = 2



func _on_Checkpoint_body_entered(body):
	checkpoint_editor.set_entered_body(body)
	checkpoint_editor.set_position(global_position)
	checkpoint_editor.emit_signal("activated")
	activate()
