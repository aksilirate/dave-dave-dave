class_name DiamondEditor
extends DiamondData






func set_last_collected_diamond_position(value):
	last_collected_diamond_position = value
	emit_signal("last_collected_diamond_position_set")
