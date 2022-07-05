class_name Packet

signal processed_changed

enum Type {HANDSHAKE, GAME_STATE, CHAT, POSITION, INPUT}


var index: int

var processed: bool



func set_processed(value):
	processed = value
	emit_signal("processed_changed")




func to_dictionary():
	return 


func from_dictionary(dictionary: Dictionary):
	return
