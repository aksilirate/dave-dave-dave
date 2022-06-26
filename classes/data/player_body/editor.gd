class_name PlayerBodyEditor
extends PlayerBodyData



func set_play_time(value: float):
	if play_time != value:
		play_time = value
		emit_signal("play_time_changed")
		emit_changed()


func add_to_play_time(amount: float):
	play_time += amount
	if amount > 0.0:
		emit_signal("play_time_changed")
		emit_changed()



func set_haste(value: float):
	if haste != value:
		haste = value
		emit_signal("haste_changed")
		emit_changed()


func remove_from_haste(amount: float):
	haste -= amount
	if amount > 0.0:
		emit_signal("haste_changed")
		emit_changed()



func set_body(arg_body: Node2D):
	body = arg_body
	emit_changed()
