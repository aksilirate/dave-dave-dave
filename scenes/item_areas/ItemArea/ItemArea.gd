class_name ItemArea
extends Area2D


onready var current_game_state: WorldGameState = DataLoader.game_state_data.current_game_state as WorldGameState
onready var local_player_body_data: PlayerBodyData = current_game_state.world_data.local_player_body_data



onready var item_area_editor: ItemAreaEditor = DataLoader.item_area_data as ItemAreaEditor


onready var sprite = $Sprite
onready var collision_shape_2d = $CollisionShape2D


export(Resource) var item = item as Item


var _signal


func _ready():
	_signal = local_player_body_data.connect("collected_items_changed", self, "_on_player_body_collected_items_changed")
		
	$AnimationPlayer.play("idle")
	_update_visibility()



func _on_player_body_collected_items_changed():
	_update_visibility()



func _update_visibility():
	if local_player_body_data.collected_items.has(global_position):
		collision_shape_2d.set_deferred("disabled", true)
		print("?")
		hide()
		return
	show()




func _on_ItemArea_body_entered(body):
	item_area_editor.set_entered_body(body)
	item_area_editor.set_item(item)
	item_area_editor.set_position(global_position)
	item_area_editor.emit_signal("activated")
