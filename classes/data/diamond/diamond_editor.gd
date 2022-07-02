class_name DiamondEditor
extends DiamondData






func set_last_collected_diamond_position(value):
	last_collected_diamond_position = value
	emit_signal("last_collected_diamond_position_set")



func add_to_diamonds(value):
	if not diamonds.has(value):
		diamonds.push_back(value)
		emit_signal("diamonds_changed")
