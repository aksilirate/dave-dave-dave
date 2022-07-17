class_name PlayerBody
extends KinematicBody2D


signal jumped
signal second_jumped
signal stepped
signal gained_haste
signal diamond_collected
signal item_collected
signal checkpoint_activated
signal item_removed
signal died



enum {IDLE, MOVING, AIR}


onready var network_data: NetworkData = DataLoader.network_data

onready var current_game_state: WorldGameState = DataLoader.game_state_data.current_game_state as WorldGameState

onready var player_body_editor: PlayerBodyEditor


onready var cutscene_animation_player_data: CutsceneAnimationPlayerData = DataLoader.cutscene_animation_player_data

onready var checkpoint_data = DataLoader.checkpoint_data as CheckpointData
onready var damage_area_data = DataLoader.damage_area_data as DamageAreaData
onready var diamond_data = DataLoader.diamond_data as DiamondData
onready var second_jump_data = DataLoader.second_jump_data as SecondJumpData
onready var item_area_data = DataLoader.item_area_data as ItemAreaData
onready var item_remover_area_data = DataLoader.item_remover_area_data as ItemRemoverAreaData
onready var mover_block_data = DataLoader.mover_block_data as MoverBlockData
onready var green_gate_data = DataLoader.green_gate_data as GreenGateData
onready var cyan_gate_data = DataLoader.cyan_gate_data as CyanGateData
onready var haste_potion_data = DataLoader.haste_potion_data as HastePotionData


export(int) var speed = 800



onready var animation_player = $AnimationPlayer
onready var jump_timer = $JumpTimer
onready var jump_audio_cooldown = $JumpAudioCooldown
onready var boots_sprite = $Sprites/BootsSprite
onready var crown_sprite = $Sprites/CrownSprite
onready var pet_body = $PetBody
onready var pet_position = $PetPosition


var player_id: int

var jumped: bool = false
var double_jumped: bool = false




var position_history: Array



var latest_sync_tick: int
var last_input_recieved: Vector2


var _signal



func _ready():
	_signal = checkpoint_data.connect("activated", self, "_on_checkpoint_activated")
	_signal = damage_area_data.connect("collided_body_set", self, "_on_damage_area_collided_body_set")
	_signal = diamond_data.connect("last_collected_diamond_position_set", self, "_on_last_collected_diamond_position_set")
	_signal = item_area_data.connect("activated", self, "_on_item_area_activated")
	_signal = item_remover_area_data.connect("activated", self, "_on_item_remover_area_activated")
	_signal = mover_block_data.connect("activated", self, "_on_mover_block_activated")
	_signal = green_gate_data.connect("entered_body_changed", self, "_on_green_gate_entered_body_changed")
	_signal = cyan_gate_data.connect("entered_body_changed", self, "_on_cyan_gate_entered_body_changed")
	_signal = haste_potion_data.connect("activated", self, "_on_haste_potion_activated")
	
	player_body_editor = get_player_body_editor()
	player_id = get_player_id()
	
	_signal = player_body_editor.connect("inventory_changed", self, "_on_inventory_changed")
	player_body_editor.set_body(self)
	
	if current_game_state.reset_data:
		player_body_editor.set_play_time(0)
		player_body_editor.set_collected_diamonds(0)
		player_body_editor.set_deaths(0)
		player_body_editor.set_inventory([])
		player_body_editor.set_collected_items([])
		player_body_editor.set_respawn_location(global_position)
		player_body_editor.set_last_position(global_position)
		player_body_editor.set_activated_checkpoints([])
		return
		
	global_position = player_body_editor.last_position
	_update_sprites()











func _on_inventory_changed():
	_update_sprites()



func _on_checkpoint_activated():
	if checkpoint_data.entered_body == self:
		
		if not player_body_editor.respawn_location == checkpoint_data.position:
			emit_signal("checkpoint_activated")
			
		player_body_editor.set_respawn_location(checkpoint_data.position)
		player_body_editor.add_to_activated_checkpoints(checkpoint_data.position)




func _on_damage_area_collided_body_set():
	if damage_area_data.entered_body == self:
		_die()






func _on_last_collected_diamond_position_set():
	player_body_editor.add_to_collected_diamonds(1)
	emit_signal("diamond_collected")






func _on_item_area_activated():
	if item_area_data.entered_body == self:
		player_body_editor.add_to_inventory(item_area_data.item)
		player_body_editor.add_to_collected_items(item_area_data.position)
		emit_signal("item_collected")




func _on_item_remover_area_activated():
	if item_remover_area_data.entered_body == self:
		player_body_editor.remove_from_inventory(item_remover_area_data.item)
		emit_signal("item_removed")



func _on_mover_block_activated():
	if mover_block_data.entered_body == self:
		jump_timer.start()
		player_body_editor.set_velocity_y(0.0)
		player_body_editor.set_displacement(
			move_and_slide(mover_block_data.velocity, Vector2.UP)
		)





func _on_green_gate_entered_body_changed():
	var inventory = player_body_editor.inventory
	if green_gate_data.entered_body == self:
		if not inventory.has(ContentManager.items.green_crown):
			_die()





func _on_cyan_gate_entered_body_changed():
	if player_body_editor.collected_diamonds < diamond_data.diamonds.size():
		_die()




func _on_haste_potion_activated():
	if haste_potion_data.entered_body == self:
		player_body_editor.add_to_haste_time(haste_potion_data.haste_time)
		emit_signal("gained_haste")





func _process(delta):
	player_body_editor.add_to_play_time(delta)
	





func _physics_process(delta):
	_simulate_displacement(delta, last_input_recieved)
	
	animation_player.playback_speed = (1.0 / speed) * float(get_speed())
	
	player_body_editor.remove_from_haste_time(delta)
	player_body_editor.set_haste_time(max(0.0, player_body_editor.haste_time))
	
	
	if is_moving():
		var gravity: float = player_body_editor.gravity
		var displacement: Vector2 = player_body_editor.displacement
		boots_sprite.offset.x = 2 * int(displacement.x < 0) if gravity > 0 else int(displacement.x > 0)
		crown_sprite.offset.x = 2 * int(displacement.x < 0) if gravity > 0 else int(displacement.x > 0)
		boots_sprite.flip_h = displacement.x < 0 if gravity > 0 else displacement.x > 0
		crown_sprite.flip_h = displacement.x < 0 if gravity > 0 else displacement.x > 0
		
		
		if displacement.x < 0:
			pet_position.position.x = 8
			
		if displacement.x > 0:
			pet_position.position.x = -8
			
			
	_play_animation_from_state(get_state())
	
	_apply_impulses()
	
	
	player_body_editor.set_last_position(global_position)







func _simulate_displacement(delta, arg_input: Vector2):
	if network_data.lobby_id:
		if not Steamworks.steam_id == player_id:
			
			if not position_history.size():
				return
				
			player_body_editor.set_displacement(Vector2.ZERO)
			
			if global_position.distance_to(position_history[0]) > 10:
				player_body_editor.set_displacement(global_position.direction_to(position_history[0]) * 35)
				
			#var _weight = min(1.0, delta * position_history.size())
				
			global_position = lerp(global_position, position_history[0], 1)
			
			
			if global_position.distance_to(position_history[0]) < 15:
				position_history.remove(0)
				
			return
			
			
	var gravity: float = player_body_editor.gravity
	
	_move(int(arg_input.x))
	
	
	if arg_input.y:
		_jump()
		
		
	if is_controllable():
		player_body_editor.set_displacement(
			move_and_slide_with_snap(
							get_velocity(), 
							get_snap(), 
							get_up_direction(),
							false, 4, PI/4, false)
							)
	
	player_body_editor.set_velocity_x(lerp(player_body_editor.velocity.x, 0, delta * 30))
	
	
	player_body_editor.set_velocity_y(min(player_body_editor.velocity.y + gravity, gravity * 10) if gravity > 0 else max(player_body_editor.velocity.y + gravity, gravity * 10))
	
	
	if is_on_floor():
		player_body_editor.set_velocity_y(0)
		jump_timer.start()
		jumped = false
		double_jumped = false
		
		
	if is_on_ceiling():
		player_body_editor.set_velocity_y(gravity)







func _apply_impulses():
	if network_data.lobby_id:
		if Steamworks.steam_id != player_id:
			return
			
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider is RigidBody2D:
			collision.collider.apply_central_impulse(-collision.normal * 50)






func _move(direction: int):
	if direction:
		player_body_editor.set_velocity_x(direction)





func _jump():
	var gravity: float = player_body_editor.gravity
	
	
	if second_jump_data.overlapping_bodies.has(self):
		player_body_editor.emit_signal("second_jumped")
		emit_signal("second_jumped")
		jump_timer.start()


	if Input.is_action_just_pressed("jump"):

		if not has_double_jump():
			return

		if double_jumped:
			return

		if is_on_floor():
			return

		if not jumped and jump_timer.is_stopped():
			if jump_audio_cooldown.is_stopped():
				jump_audio_cooldown.start()
				emit_signal("jumped")
			player_body_editor.set_velocity_y(-3 if gravity > 0 else 3)
			double_jumped = true


		if jumped:

			if jump_audio_cooldown.is_stopped():
				jump_audio_cooldown.start()
				emit_signal("jumped")

			player_body_editor.set_velocity_y(-3 if gravity > 0 else 3)
			double_jumped = true



	if not jump_timer.is_stopped():
		if jump_audio_cooldown.is_stopped():
			jump_audio_cooldown.start()
			emit_signal("jumped")
		jump_timer.stop()
		jumped = true
		player_body_editor.set_velocity_y(-3 if gravity > 0 else 3)











func _play_animation_from_state(state: int):
	if is_playing_death_animation():
		return
		
	match state:
		IDLE:
			animation_player.play("idle")
		MOVING:
			if abs(player_body_editor.displacement.x) > 0.0:
				animation_player.play("move")
			else:
				animation_player.play("idle")
		AIR:
			animation_player.play("air")







func _die():
	if not animation_player.current_animation == "death":
		player_body_editor.add_to_deaths(1)
		animation_player.play("death")
		emit_signal("died")





func _respawn():
	global_position = player_body_editor.respawn_location
	pet_body.global_position = pet_position.global_position
	player_body_editor.set_velocity(Vector2.ZERO)
	jumped = false






func _update_sprites():
	var inventory = player_body_editor.inventory
	if inventory.has(ContentManager.items.double_jump):
		boots_sprite.show()
	if inventory.has(ContentManager.items.green_crown):
		crown_sprite.show()



func get_player_body_editor() -> PlayerBodyEditor:
	return player_body_editor


func get_player_id() -> int:
	return 0



func get_velocity() -> Vector2:
	return Vector2(player_body_editor.velocity.x  * get_speed(), player_body_editor.velocity.y * speed)



func get_snap() -> Vector2:
	return Vector2.DOWN if player_body_editor.gravity > 0 else Vector2.UP * int(is_on_floor())



func get_up_direction() -> Vector2:
	return Vector2.UP if player_body_editor.gravity > 0 else Vector2.DOWN





func get_speed() -> int:
	return (speed + (300 * int(player_body_editor.haste_time > 0)))





func get_state() -> int:
	if not is_controllable():
		return IDLE
	
	
	if not is_on_floor() and abs(player_body_editor.velocity.y) > 0.1:
		return AIR

	if is_moving():
		return MOVING

	return IDLE





func is_controllable() -> bool:
	if is_playing_death_animation():
		return false
	
	return true




func is_moving() -> bool:
	return player_body_editor.displacement.x > 30 or player_body_editor.displacement.x < -30




func is_playing_death_animation() -> bool:
	return animation_player.current_animation == "death" and animation_player.is_playing()




func has_double_jump() -> bool:
	return player_body_editor.inventory.has(ContentManager.items.double_jump)








#var pet_chamber_overlapping: bool = false




#func _on_damage_area_last_collided_body_set():
#	if Game.damage_area_data.last_collided_body == self:
#		Audio.play("res://assets/sounds/death.wav")
#		animation_player.play("death")





#
#func play_footstep():
#	Audio.play("res://assets/sounds/step.wav", -15.0, rand_range(0.85, 1.15))





func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "death":
		_respawn()


func _on_PlayerBody_tree_exiting():
	player_body_editor.emit_changed()



