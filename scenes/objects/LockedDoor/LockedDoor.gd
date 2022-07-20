class_name LockedDoor
extends ItemRemoverArea





func _ready():
	_signal = local_player_body_data.connect("activated_item_removers_changed", self, "_on_local_player_body_activated_item_removers_changed")
	update_locked_door()



func _on_local_player_body_activated_item_removers_changed():
	update_locked_door()


func update_locked_door():
	if local_player_body_data.activated_item_removers.has(global_position):
		hide()
		return
		
	show()
