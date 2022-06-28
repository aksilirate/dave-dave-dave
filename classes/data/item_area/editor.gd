class_name ItemAreaEditor
extends ItemAreaData





func set_last_body_collected_item(value):
	last_body_collected_item = value
	emit_signal("last_body_collected_item_set")



func set_last_collected_item(value):
	last_collected_item = value
	emit_signal("last_collected_item_set")



func set_last_collected_item_position(value):
	last_collected_item_position = value
	emit_signal("last_collected_item_position_set")
