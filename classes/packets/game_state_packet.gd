class_name GameStatePacket
extends Packet


var scene_path: String



func to_dictionary() -> Dictionary:
	var dictionary = {
		"type": Type.GAME_STATE,
		"scene_path": scene_path
	}
	return dictionary




func from_dictionary(dictionary: Dictionary) -> GameStatePacket:
	scene_path = dictionary["scene_path"]
	return self
