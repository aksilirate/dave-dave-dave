class_name ChatInputEditor
extends ChatInputData


func set_shown(value):
	shown = value
	emit_signal("shown_changed")



func set_text(value):
	text = value
