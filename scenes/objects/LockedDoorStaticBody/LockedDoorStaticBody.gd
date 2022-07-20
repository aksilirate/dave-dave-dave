extends StaticBody2D



onready var current_game_state: WorldGameState = DataLoader.game_state_data.current_game_state as WorldGameState
onready var local_player_body_data: PlayerBodyData = current_game_state.world_data.local_player_body_data

onready var collision_shape = $CollisionShape2D



var _signal


func _ready():
	_signal = local_player_body_data.connect("activated_item_removers_changed", self, "_on_local_player_body_activated_item_removers_changed")
	update_locked_door_static_body()



func _on_local_player_body_activated_item_removers_changed():
	update_locked_door_static_body()


func update_locked_door_static_body():
	if local_player_body_data.activated_item_removers.has(global_position):
		collision_shape.set_deferred("disabled", true)
		return
		
	collision_shape.set_deferred("disabled", false)

