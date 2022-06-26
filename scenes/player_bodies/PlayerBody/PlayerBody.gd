class_name PlayerBody
extends KinematicBody2D

signal second_jumped


enum {IDLE, MOVING, AIR}



export(Resource) var player_body_editor = player_body_editor as PlayerBodyEditor setget _player_body_editor
var player_body_data: PlayerBodyData


export(Resource) var second_jump_data = second_jump_data as SecondJumpData



export(bool) var new_game


export(bool) var controllable = true


export(int) var speed = 800
export(float) var gravity = 0.25
export(bool) var double_jump: bool = false



onready var animation_player = $AnimationPlayer
onready var jump_timer = $JumpTimer
onready var jump_audio_cooldown = $JumpAudioCooldown
onready var boots_sprite = $Sprites/BootsSprite
onready var crown_sprite = $Sprites/CrownSprite
onready var haste_progress_bar = $CanvasLayer/HasteProgressBar
onready var time_label = $CanvasLayer/HBoxContainer2/VBoxContainer/TimeLabel
onready var pet_body = $PetBody
onready var pet_position = $PetPosition



var jumped: bool = false
var double_jumped: bool = false

var velocity: Vector2
var displacement: Vector2




func _player_body_editor(value):
	player_body_editor = value
	player_body_data = player_body_editor as PlayerBodyData







func _ready():
	player_body_editor.set_body(self)
	if new_game:
		player_body_editor.set_play_time(0)




func _process(delta):
	player_body_editor.add_to_play_time(delta)





func _physics_process(delta):
	if is_playing_death_animation():
		return

	animation_player.playback_speed = (1.0 / speed) * float(get_speed())
	
	player_body_editor.remove_from_haste(delta)
	player_body_editor.set_haste(max(0.0, player_body_editor.haste))
	
	
	displacement = move_and_slide_with_snap(Vector2(velocity.x  * get_speed(), velocity.y * speed), 
						Vector2.DOWN if gravity > 0 else Vector2.UP * int(is_on_floor()), 
						Vector2.UP if gravity > 0 else Vector2.DOWN , false, 4, PI/4, false)
						
						
	velocity.y = min(velocity.y + gravity, gravity * 10) if gravity > 0 else max(velocity.y + gravity, gravity * 10)
	
	if is_on_floor():
		velocity.y = 0
		jump_timer.start()
		jumped = false
		double_jumped = false
		
	if is_on_ceiling():
		velocity.y = gravity
		
		
		
	if is_moving():
		boots_sprite.offset.x = 2 * int(displacement.x < 0) if gravity > 0 else int(displacement.x > 0)
		crown_sprite.offset.x = 2 * int(displacement.x < 0) if gravity > 0 else int(displacement.x > 0)
		boots_sprite.flip_h = displacement.x < 0 if gravity > 0 else displacement.x > 0
		crown_sprite.flip_h = displacement.x < 0 if gravity > 0 else displacement.x > 0


		if displacement.x < 0:
			pet_position.position.x = 8

		if displacement.x > 0:
			pet_position.position.x = -8


	_play_animation_from_state(get_state())

	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider is RigidBody2D:
			collision.collider.apply_central_impulse(-collision.normal * 50)










func _move(direction: int):
	velocity.x = direction





func _jump():
	if second_jump_data.overlapping_bodies.has(self):
		player_body_editor.emit_signal("second_jumped", self)
#		Audio.play("res://assets/sounds/second_jump.wav", -10)
		jump_timer.start()


	if Input.is_action_just_pressed("jump"):

		if not double_jump:
			return

		if double_jumped:
			return

		if is_on_floor():
			return

		if not jumped and jump_timer.is_stopped():
			if jump_audio_cooldown.is_stopped():
				jump_audio_cooldown.start()
#				Audio.play("res://assets/sounds/jump.wav")

			velocity.y = -3 if gravity > 0 else 3
			double_jumped = true


		if jumped:

			if jump_audio_cooldown.is_stopped():
				jump_audio_cooldown.start()
#				Audio.play("res://assets/sounds/jump.wav")

			velocity.y = -3 if gravity > 0 else 3
			double_jumped = true



	if not jump_timer.is_stopped():
		if jump_audio_cooldown.is_stopped():
			jump_audio_cooldown.start()
#			Audio.play("res://assets/sounds/jump.wav")
		jump_timer.stop()
		jumped = true
		velocity.y = -3 if gravity > 0 else 3







func _play_animation_from_state(state: int):
	if is_playing_death_animation():
		return
	match state:
		IDLE:
			animation_player.play("idle")
		MOVING:
			if Input.get_action_strength("move_right") - Input.get_action_strength("move_left"):
				animation_player.play("move")
			else:
				animation_player.play("idle")
		AIR:
			animation_player.play("air")








func get_speed() -> int:
	return (speed + (300 * int(player_body_editor.haste > 0)))





func get_state() -> int:
	if not is_on_floor() and abs(velocity.y) > 0.25:
		return AIR

	if is_moving():
		return MOVING

	return IDLE






func is_moving() -> bool:
	return displacement.x > 0.1 or displacement.x < -0.1




func is_playing_death_animation() -> bool:
	return animation_player.current_animation == "death" and animation_player.is_playing()






#
#

#export(bool) var has_crown: bool = false

#
#
#var respawn_location: Vector2
#
#

#
#
#var inventory: Array





#var pet_chamber_overlapping: bool = false










#func _ready():
#	Game.damage_area_data.connect("last_collided_body_set", self, "_on_damage_area_last_collided_body_set")
#
#
#
#	if Save.exists() and not Globals.zero_deaths_mode:
#		time = Save.get_player_time()
#		double_jump = Save.get_player_double_jump()
#		if double_jump:
#			boots_sprite.show()
#		has_crown = Save.get_player_crown()
#		if has_crown:
#			crown_sprite.show()
#		diamonds_collected = Save.get_player_diamonds_collected()
#
#
#		var saved_position = Save.get_player_global_position()
#		if saved_position != null:
#			global_position = saved_position
#
#
#		inventory = Save.get_player_inventory()
##		update_inventory()
#
#	pet_body.global_position = pet_position.global_position
#
#
#
#
#
#
#
#func _on_damage_area_last_collided_body_set():
#	if Game.damage_area_data.last_collided_body == self:
#		Audio.play("res://assets/sounds/death.wav")
#		animation_player.play("death")







#












#
#
#
#
#
#func respawn():
#	global_position = respawn_location
#	pet_body.global_position = pet_position.global_position
#	velocity = Vector2.ZERO
#	jumped = false
#
#
#
#func add_item_to_inventory(item: Item):
#	inventory.push_back(item)
##	update_inventory()
#
#
#
#
##func remove_item_from_inventory(item: Item):
##	inventory.erase(item)
##	update_inventory()
#
#
#
#
##func update_inventory():
##	for child in items_container.get_children():
##		child.queue_free()
##
##	for element in inventory:
##		var item: Item = element
##		var texture_rect = TextureRect.new()
##		texture_rect.name = item.name
##		texture_rect.texture = load(item.texture_path)
##		items_container.add_child(texture_rect)
##		texture_rect.modulate = item.color
##		texture_rect.set_size(Vector2(1,1))
#
#
#
#
#
#func apply_haste(haste_time: int):
#	haste = haste_time
#	haste_progress_bar.max_value = haste_time * 10
#
#
#

#
#
#
#
#func update_diamonds_collected(arg_total_diamonds) -> void:
#	diamonds_label.text = str(diamonds_collected) + "/" + str(arg_total_diamonds)
#
#
#

#
#
#
#func play_footstep():
#	Audio.play("res://assets/sounds/step.wav", -15.0, rand_range(0.85, 1.15))
#
#
#
#func _increase_death_count():
#	if Globals.zero_deaths_mode:
## warning-ignore:return_value_discarded
#		get_tree().reload_current_scene()
#	deaths += 1
#
#
#
#
