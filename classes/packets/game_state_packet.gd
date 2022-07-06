class_name GameStatePacket
extends Packet


var scene_path: String



func to_dictionary() -> Dictionary:
	var dictionary = .to_dictionary()
	
	dictionary["type"] = Type.GAME_STATE
	dictionary["scene_path"] = scene_path
	
	return dictionary




func from_dictionary(dictionary: Dictionary) -> GameStatePacket:
	.from_dictionary(dictionary)
	scene_path = dictionary["scene_path"]
	return self
