class_name PositionPacket
extends Packet


var id: int
var position: Vector2



func to_dictionary() -> Dictionary:
	var dictionary = .to_dictionary()
	
	dictionary["type"] = Type.POSITION
	dictionary["id"] = id
	dictionary["position"] =position
	
	return dictionary




func from_dictionary(dictionary: Dictionary) -> PositionPacket:
	.from_dictionary(dictionary)
	id = dictionary["id"]
	position = dictionary["position"]
	return self
