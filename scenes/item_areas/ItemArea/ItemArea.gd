class_name ItemArea
extends Area2D


export(NodePath) onready var world_scene = get_node(world_scene) as WorldScene


onready var player_body_data = world_scene.world_data.player_body_data as PlayerBodyData

onready var item_area_editor: ItemAreaEditor = DataLoader.item_area_data as ItemAreaEditor



onready var sprite = $Sprite

export(Resource) var item = item as Item


func _ready():
	player_body_data.connect("collected_items_changed", self, "_on_player_body_collected_items_changed")
	$AnimationPlayer.play("idle")
	_update_visibility()



func _on_player_body_collected_items_changed():
	_update_visibility()



func _update_visibility():
	if player_body_data.collected_items.has(global_position):
		hide()
		return
	show()




func _on_ItemArea_body_entered(body):
	item_area_editor.set_collected_body(body)
	item_area_editor.set_item(item)
	item_area_editor.set_position(global_position)
	item_area_editor.emit_signal("activated")
