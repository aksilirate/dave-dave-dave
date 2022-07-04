class_name NetworkData
extends DataResource


signal lobby_id_changed
signal connected_players_changed
signal packet_set


var lobby_id: int setget _lobby_id

var connected_players: Array setget _connected_players

var packet: Packet setget _packet



func _lobby_id(_value):
	return


func _connected_players(value):
	return


func _packet(_value):
	return


func is_lobby_owner() -> bool:
	return Steam.getLobbyOwner(lobby_id) == Steam.getSteamID()
