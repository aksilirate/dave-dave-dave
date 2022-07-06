class_name Packet

signal processed_changed

enum Type {HANDSHAKE, GAME_STATE, CHAT, POSITION, INPUT}


var time_sent: int

var processed: bool



func set_processed(value):
	processed = value
	emit_signal("processed_changed")




func to_dictionary() -> Dictionary:
	var dictionary = {}
	
	dictionary["time_sent"] = time_sent
	
	return dictionary




func from_dictionary(dictionary: Dictionary):
	time_sent = dictionary["time_sent"]
	
	return
