class_name ItemRemoverArea
extends Area2D

signal item_removed

export(NodePath) onready var world_scene = get_node(world_scene) as WorldScene

onready var local_player_body_data = world_scene.world_data.player_body_data as PlayerBodyData

onready var item_remover_area_editor = DataLoader.item_remover_area_data as ItemRemoverAreaEditor

export(Resource) var item_to_remove




func _on_ItemRemoverArea_body_entered(body):
	if body == local_player_body_data.body:
		
		if not local_player_body_data.inventory.has(item_to_remove):
			return
			
		item_remover_area_editor.set_body_entered(body)
		item_remover_area_editor.set_item_to_remove(item_to_remove)
		item_remover_area_editor.emit_signal("activated")
		emit_signal("item_removed")
