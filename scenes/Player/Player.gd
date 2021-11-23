class_name Player
extends KinematicBody2D

enum {IDLE, MOVING, AIR}

onready var animation_player = $AnimationPlayer
onready var items_container = $CanvasLayer/HBoxContainer/ItemsContainer
onready var sprite = $Sprites/Sprite
onready var boots_sprite = $Sprites/BootsSprite
onready var crown_sprite = $Sprites/CrownSprite
onready var jump_timer = $JumpTimer
onready var diamonds_label = $CanvasLayer/HBoxContainer/DiamondsLabel
onready var jump_audio_cooldown = $JumpAudioCooldown
onready var haste_progress_bar = $CanvasLayer/HasteProgressBar
onready var time_label = $CanvasLayer/VBoxContainer/TimeLabel
onready var death_count_label = $CanvasLayer/VBoxContainer/DeathCountLabel


export(bool) var double_jump: bool = false
export(bool) var has_crown: bool = false
export(bool) var controlled = true
export var speed: int


var respawn_location: Vector2

var gravity: float = 0.25

var velocity: Vector2
var displacement: Vector2

var diamonds_collected: int

var inventory: Array
var double_jumped: bool = false
var jumped: bool = false

var haste: float 

var deaths: int = 0
var time: float = 0


func _process(delta):
	time += delta
	var mils = fmod(time,1)*1000
	var sec = fmod(time, 60)
	var mins = fmod(time, 60*60) / 60
	var hours = fmod(fmod(time, 3600*60) / 3600, 24)
	time_label.text = "%02d:%02d:%02d.%03d" % [hours, mins, sec, mils]


func _physics_process(delta):
	
	haste -= delta
	haste = max(0, haste)
	haste_progress_bar.value = haste * 10
	
	sprite.modulate = Color("#00f8f8")
	if haste > 0:
		sprite.modulate = Color("#f800f8")
	
	animation_player.playback_speed = (1.0 / speed) * float(get_speed())
	
	if is_playing_death_animation():
		return
	
	
	displacement = move_and_slide_with_snap(Vector2(velocity.x  * get_speed(), velocity.y * speed), Vector2.DOWN * int(is_on_floor()), Vector2.UP, false, 4, PI/4, false)
	
	if controlled:
		velocity.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	
	velocity.y = min(velocity.y + gravity, gravity * 10)
	
	
	if is_on_floor():
		velocity.y = 0
		jump_timer.start()
		jumped = false
		double_jumped = false
		
	
	if not jumped and jump_timer.is_stopped() and Input.is_action_just_pressed("jump") and controlled and not is_on_floor() and double_jump and not double_jumped:
		if jump_audio_cooldown.is_stopped():
			jump_audio_cooldown.start()
			Audio.play("res://assets/sounds/jump.wav")
		velocity.y = -3
		double_jumped = true
	
	if Input.is_action_just_pressed("jump") and controlled and not is_on_floor() and double_jump and jumped and not double_jumped:
		if jump_audio_cooldown.is_stopped():
			jump_audio_cooldown.start()
			Audio.play("res://assets/sounds/jump.wav")
		velocity.y = -3
		double_jumped = true
	
	if Input.get_action_strength("jump") and controlled and not jump_timer.is_stopped():
		if jump_audio_cooldown.is_stopped():
			jump_audio_cooldown.start()
			Audio.play("res://assets/sounds/jump.wav")
		jump_timer.stop()
		jumped = true
		velocity.y = -3
	

	
	if is_on_ceiling():
		velocity.y = gravity
	
	if is_moving():
		sprite.offset.x = 2 * int(displacement.x < 0)
		boots_sprite.offset.x = 2 * int(displacement.x < 0)
		crown_sprite.offset.x = 2 * int(displacement.x < 0)
		sprite.flip_h = displacement.x < 0
		boots_sprite.flip_h = displacement.x < 0
		crown_sprite.flip_h = displacement.x < 0
	
	play_animation_from_state(get_state())
	
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider is RigidBody2D:
			collision.collider.apply_central_impulse(-collision.normal * 50)
	
	
	
	
	
	
func is_moving() -> bool:
	return displacement.x > 0.1 or displacement.x < -0.1
	
	
func get_state() -> int:
	if not is_on_floor() and abs(velocity.y) > 0.25:
		return AIR
	
	if is_moving():
		return MOVING
		
	return IDLE
	
	
func play_animation_from_state(state: int):
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
	
	
func respawn():
	global_position = respawn_location


func add_item_to_inventory(item: Item):
	inventory.push_back(item)
	update_inventory()
	
func remove_item_from_inventory(item: Item):
	inventory.erase(item)
	update_inventory()

func update_inventory():
	for child in items_container.get_children():
		child.queue_free()
		
	for element in inventory:
		var item: Item = element
		var texture_rect = TextureRect.new()
		texture_rect.name = item.name
		texture_rect.texture = load(item.texture_path)
		items_container.add_child(texture_rect)
		texture_rect.modulate = item.color
		texture_rect.set_size(Vector2(1,1))
		
		
func apply_haste(haste_time: int):
	haste = haste_time
	haste_progress_bar.max_value = haste_time * 10

func get_speed() -> int:
	return (speed + (300 * int(haste > 0)))

		
func update_diamonds_collected(arg_total_diamonds) -> void:
	diamonds_label.text = str(diamonds_collected) + "/" + str(arg_total_diamonds)
		
		
func is_playing_death_animation() -> bool:
	return animation_player.current_animation == "death" and animation_player.is_playing()

func play_footstep():
	Audio.play("res://assets/sounds/step.wav", -15.0, rand_range(0.85, 1.15))

func increase_death_count():
	deaths += 1
	death_count_label.text = "deaths: " + str(deaths)
