class_name DiamondEditor
extends DiamondData






func set_last_collected_diamond_position(value):
	last_collected_diamond_position = value
	emit_signal("last_collected_diamond_position_set")



func add_to_total_diamonds(value):
	if value > 0:
		total_diamonds += value
		emit_signal("total_diamonds_changed")
