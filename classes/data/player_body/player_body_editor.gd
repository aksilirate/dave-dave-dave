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
	if inventory != arg_inventory:
		inventory = arg_inventory
		emit_signal("inventory_changed")
	emit_signal("inventory_set")
	emit_changed()



func add_to_inventory(item: Item):
	if not inventory.has(item):
		inventory.push_back(item.duplicate())
		emit_signal("inventory_changed")
		emit_changed()



func remove_from_inventory(item: Item):
	if inventory.has(item):
		inventory.erase(item)
		emit_signal("inventory_changed")
		emit_changed()



func set_collected_items(arg_collected_items):
	if collected_items != arg_collected_items:
		collected_items = arg_collected_items
		emit_signal("collected_items_changed")
	emit_signal("collected_items_set")
	emit_changed()



func add_to_collected_items(collected_item):
	if not collected_items.has(collected_item):
		collected_items.push_back(collected_item)
		emit_signal("collected_items_changed")
		emit_changed()



func set_collected_diamonds(value: int):
	collected_diamonds = value
	emit_signal("collected_diamonds_changed")
	emit_changed()



func add_to_collected_diamonds(amount: int):
	collected_diamonds += amount
	emit_signal("collected_diamonds_changed")
	emit_changed()




func set_haste_time(value: float):
	if haste_time != value:
		haste_time = value
		emit_signal("haste_time_changed")


func add_to_haste_time(value: float):
	if value > 0.0:
		haste_time += value
		emit_signal("haste_time_changed")





func remove_from_haste_time(amount: float):
	haste_time -= amount
	if amount > 0.0:
		emit_signal("haste_time_changed")



func set_deaths(value: int):
	deaths = value
	emit_signal("deaths_changed")
	emit_changed()


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
	last_position = value
	emit_signal("last_position_set")



func set_velocity(value):
	velocity = value
	emit_signal("velocity_set")



func set_velocity_x(value):
	velocity.x = value
	emit_signal("velocity_set")



func set_velocity_y(value):
	velocity.y = value
	emit_signal("velocity_set")




func set_gravity(value):
	gravity = value


func set_displacement(value):
	displacement = value



func set_input(value):
	input = value
	emit_signal("input_set")


