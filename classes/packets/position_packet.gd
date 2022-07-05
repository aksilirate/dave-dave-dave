class_name PositionPacket
extends Packet


var id: int
var position: Vector2



func to_dictionary() -> Dictionary:
	var dictionary = {
		"type": Type.POSITION,
		"id": id,
		"position": position
	}
	return dictionary




func from_dictionary(dictionary: Dictionary) -> PositionPacket:
	id = dictionary["id"]
	position = dictionary["position"]
	return self
