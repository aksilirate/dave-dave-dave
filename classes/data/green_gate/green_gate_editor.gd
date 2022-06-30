class_name GreenGateEditor
extends GreenGateData




func set_entered_body(value):
	entered_body = value
	emit_signal("entered_body_changed")
