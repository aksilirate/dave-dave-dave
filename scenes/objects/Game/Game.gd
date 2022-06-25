extends Node

signal current_state_changed

enum State {
	TITLE_SCREEN,
}


var options_data: OptionsData = preload("res://data/Options.tres")

var generic_button_data: GenericButtonData = preload("res://data/GenericButton.tres")

var player_body_data: PlayerBodyData = preload("res://data/PlayerBody.tres")
var damage_area_data: DamageAreaData = preload("res://data/DamageArea.tres")
var second_jump_data: SecondJumpData = preload("res://data/SecondJump.tres")





var current_state: int setget _current_state


func _current_state(_value):
	return



func _set_state(state):
	current_state = state
	emit_signal("current_state_changed")
