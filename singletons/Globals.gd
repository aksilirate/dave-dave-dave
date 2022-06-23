extends Node


var ghost_mode: bool = false
var zero_deaths_mode: bool = false

var steamworks_loaded: bool = true


func _ready():
	if not Steamworks.has_method("is_owned"):
		steamworks_loaded = false
