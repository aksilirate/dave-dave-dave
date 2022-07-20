class_name LockedDoor
extends ItemRemoverArea


onready var locked_door_editor = DataLoader.locked_door_data as LockedDoorEditor



func _on_LockedDoor_item_removed():
	locked_door_editor.set_last_unlock_position(global_position)
	hide()
