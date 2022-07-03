class_name HandshakePacket
extends Packet




func to_dictionary() -> Dictionary:
	var dictionary = {
		"type": Type.HANDSHAKE,
	}
	return dictionary
