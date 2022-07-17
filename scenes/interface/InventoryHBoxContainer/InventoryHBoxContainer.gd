class_name InventoryHBoxContainer
extends HBoxContainer


onready var current_game_state: WorldGameState = DataLoader.game_state_data.current_game_state as WorldGameState
onready var local_player_body_data: PlayerBodyData = current_game_state.world_data.local_player_body_data


var _signal


func _ready():
	_signal = local_player_body_data.connect("inventory_changed", self, "_on_local_player_body_inventory_changed")
	_update_items()


func _on_local_player_body_inventory_changed():
	_update_items()



func _update_items():
	for element in get_children():
		var node: Node = element
		node.queue_free()
	
	
	for element in local_player_body_data.inventory:
		var item: Item = load(element)
		var item_texture_rect = preload("res://scenes/interface/ItemTextureRect/ItemTextureRect.tscn").instance()
		
		if item.texture == null:
			continue
			
		item_texture_rect.texture = item.texture
		item_texture_rect.modulate = item.color
		add_child(item_texture_rect)
