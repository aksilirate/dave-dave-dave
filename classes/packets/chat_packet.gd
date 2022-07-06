class_name ChatPacket
extends Packet



var text: String



func to_dictionary() -> Dictionary:
	var dictionary = .to_dictionary()
	
	dictionary["type"] = Type.CHAT
	dictionary["text"] = text
	
	return dictionary




func from_dictionary(dictionary: Dictionary) -> ChatPacket:
	.from_dictionary(dictionary)
	text = dictionary["text"]
	return self
