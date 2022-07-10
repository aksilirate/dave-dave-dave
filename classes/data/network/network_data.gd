class_name NetworkData
extends DataResource


signal lobby_id_changed
signal connected_players_changed

signal packet_sent
signal packet_received

signal ping_changed



var lobby_id: int setget _lobby_id

var connected_players: Array setget _connected_players


var sent_packet: Packet setget _sent_packet

var received_packet: Packet setget _received_packet


var ping: int setget _ping






func _lobby_id(_value):
	return


func _connected_players(value):
	return


func _request_packet_index(_value):
	return


func _sent_packet(_value):
	return


func _received_packet(_value):
	return


func _ping(_value):
	return


func get_looby_owner_id() -> int:
	return Steam.getLobbyOwner(lobby_id)

func is_lobby_owner() -> bool:
	return Steam.getLobbyOwner(lobby_id) == Steam.getSteamID()
