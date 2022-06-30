class_name ItemRemoverArea
extends Area2D

signal item_removed

export(NodePath) onready var world_scene = get_node(world_scene) as WorldScene

onready var item_remover_area_editor = DataLoader.item_remover_area_data as ItemRemoverAreaEditor

export(Resource) var item_to_remove




func _on_ItemRemoverArea_body_entered(body):
	for value in world_scene.world_data.local_player_bodies_data.values():
		var player_body_data: PlayerBodyData = value
		if player_body_data.body == body:
			if not player_body_data.inventory.has(item_to_remove):
				return
				
			item_remover_area_editor.set_entered_body(body)
			item_remover_area_editor.set_item(item_to_remove)
			item_remover_area_editor.emit_signal("activated")
			emit_signal("item_removed")
