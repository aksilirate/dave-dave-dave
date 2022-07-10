class_name PlayerBodyData
extends DataResource

signal second_jumped

signal play_time_changed

signal inventory_set
signal inventory_changed

signal collected_items_set
signal collected_items_changed


signal haste_time_changed
signal deaths_changed

signal activated_checkpoints_set
signal activated_checkpoints_changed

signal respawn_location_changed

signal last_position_set
signal last_velocity_set

signal input_set


export(float) var play_time setget _play_time

export(Array) var inventory: Array setget _inventory

export(Array) var collected_items: Array setget _collected_items

export(int) var diamonds_collected setget _diamonds_collected

var haste_time: float setget _haste_time 

export(int) var deaths setget _deaths

export(Array) var activated_checkpoints: Array setget _activated_checkpoints

export(Vector2) var respawn_location setget _respawn_location


export(Vector2) var last_position setget _last_position
var last_velocity: Vector2 setget _last_velocity



var input: Vector2 setget _input

var body: Node2D



func _play_time(value):
	if not DataLoader.finished:
		play_time = value


func _inventory(value):
	if not DataLoader.finished:
		inventory = value


func _collected_items(value):
	if not DataLoader.finished:
		collected_items = value



func _diamonds_collected(value):
	if not DataLoader.finished:
		diamonds_collected = value


func _haste_time(value):
	if not DataLoader.finished:
		haste_time = value


func _deaths(value):
	if not DataLoader.finished:
		deaths = value


func _activated_checkpoints(value):
	if not DataLoader.finished:
		activated_checkpoints = value


func _respawn_location(value):
	if not DataLoader.finished:
		respawn_location = value


func _last_position(value):
	if not DataLoader.finished:
		last_position = value


func _last_velocity(_value):
	return


func _input(_value):
	return
