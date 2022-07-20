class_name ItemRemoverArea
extends Area2D

signal item_removed

onready var current_game_state: WorldGameState = DataLoader.game_state_data.current_game_state as WorldGameState
onready var local_player_body_data: PlayerBodyData = current_game_state.world_data.local_player_body_data


onready var item_remover_area_editor = DataLoader.item_remover_area_data as ItemRemoverAreaEditor

export(Resource) var item_to_remove






func _on_ItemRemoverArea_body_entered(body):
	if local_player_body_data.body == body:
		if not local_player_body_data.inventory.has(item_to_remove.resource_path):
			return
			
		item_remover_area_editor.set_entered_body(body)
		item_remover_area_editor.set_item(item_to_remove)
		item_remover_area_editor.emit_signal("activated")
		emit_signal("item_removed")
