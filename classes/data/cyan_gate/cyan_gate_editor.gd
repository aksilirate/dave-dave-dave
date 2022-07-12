class_name CyanGateEditor
extends CyanGateData




func set_entered_body(value):
	entered_body = value
	emit_signal("entered_body_changed")
