class_name PlayerBodyEditor
extends PlayerBodyData



func set_play_time(value: float):
	if play_time != value:
		play_time = value
		emit_signal("play_time_changed")


func add_to_play_time(amount: float):
	play_time += amount
	if amount > 0.0:
		emit_signal("play_time_changed")



func set_inventory(arg_inventory):
	inventory = arg_inventory
	emit_signal("inventory_set")
	emit_changed()



func add_to_inventory(item):
	inventory.push_back(item)
	emit_signal("inventory_changed")
	emit_changed()




func set_haste(value: float):
	if haste != value:
		haste = value
		emit_signal("haste_changed")


func remove_from_haste(amount: float):
	haste -= amount
	if amount > 0.0:
		emit_signal("haste_changed")



func add_to_deaths(amount: int):
	deaths += amount
	emit_signal("deaths_changed")
	emit_changed()



func set_body(arg_body: Node2D):
	body = arg_body
	emit_changed()





func set_activated_checkpoints(value):
	activated_checkpoints = value
	emit_signal("activated_checkpoints_set")
	emit_changed()



func add_to_activated_checkpoints(value):
	if not activated_checkpoints.has(value):
		activated_checkpoints.push_back(value)
		emit_signal("activated_checkpoints_changed")
		emit_changed()





func set_respawn_location(value):
	if respawn_location != value:
		respawn_location = value
		emit_signal("respawn_location_changed")
		emit_changed()





func set_last_position(value):
	if last_position != value:
		last_position = value
		emit_signal("last_position_changed")
		emit_changed()







