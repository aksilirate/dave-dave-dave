class_name InputPacket
extends Packet


var id: int
var input: Vector2
var position: Vector2


func to_dictionary() -> Dictionary:
	var dictionary = .to_dictionary()
	
	dictionary["type"] = Type.INPUT
	dictionary["id"] = id
	dictionary["input"] = input
	dictionary["position"] = position
	
	return dictionary




func from_dictionary(dictionary: Dictionary) -> InputPacket:
	.from_dictionary(dictionary)
	id = dictionary["id"]
	input = dictionary["input"]
	position = dictionary["position"]
	return self
