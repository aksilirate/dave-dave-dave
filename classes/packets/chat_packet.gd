class_name ChatPacket
extends Packet



var text: String



func to_dictionary() -> Dictionary:
	var dictionary = {
		"type": Type.CHAT,
		"text": text
	}
	return dictionary




func from_dictionary(dictionary: Dictionary) -> ChatPacket:
	text = dictionary["text"]
	return self
