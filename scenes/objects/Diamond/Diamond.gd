class_name Diamond
extends Area2D


onready var current_game_state: WorldGameState = DataLoader.game_state_data.current_game_state as WorldGameState
onready var local_player_body_data = current_game_state.world_data.local_player_body_data as PlayerBodyData

onready var diamond_editor = DataLoader.diamond_data as DiamondEditor


var _signal


func _ready():
	_signal = local_player_body_data.connect("collected_diamonds_changed", self, "_on_local_player_body_collected_diamonds_changed")
	$AnimationPlayer.play("idle")
	diamond_editor.add_to_diamonds(global_position)
	update_diamond()



func _on_local_player_body_collected_diamonds_changed():
	update_diamond()



func update_diamond():
	if local_player_body_data.collected_diamonds.has(global_position):
		queue_free()



func _on_Diamond_body_entered(_body):
	diamond_editor.set_last_collected_diamond_position(global_position)

