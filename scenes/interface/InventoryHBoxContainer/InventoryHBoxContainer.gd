class_name InventoryHBoxContainer
extends HBoxContainer


export(NodePath) onready var player_body = get_node(player_body) as PlayerBody



func _ready():
	player_body.connect("ready", self, "_on_player_body_ready")



func _on_player_body_ready():
	player_body.player_body_data.connect("inventory_changed", self, "_on_player_body_inventory_changed")
	_update_items()


func _on_player_body_inventory_changed():
	_update_items()



func _update_items():
	for element in get_children():
		var node: Node = element
		node.queue_free()
	
	
	for element in player_body.player_body_data.inventory:
		var item: Item = element
		var item_texture_rect = preload("res://scenes/interface/ItemTextureRect/ItemTextureRect.tscn").instance()
		item_texture_rect.texture = item.texture
		item_texture_rect.modulate = item.color
		add_child(item_texture_rect)
