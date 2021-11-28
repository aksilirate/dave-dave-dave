extends Node


onready var animation_player = $AnimationPlayer
onready var checkpoints = $World/Checkpoints
onready var spikes = $World/Spikes
onready var items = $World/Items
onready var locked_doors = $World/LockedDoors
onready var moving_platforns = $World/MovingPlatforms
onready var second_jumps = $World/SecondJumps
onready var wall_guns = $World/WallGuns
onready var diamonds = $World/Diamonds
onready var mover_blocks = $World/MoverBlocks
onready var double_jump = $World/DoubleJump
onready var crown = $World/Crown
onready var player = $World/Player
onready var haste_potions = $World/HastePotions
onready var green_gates = $World/GreenGates

var deleted_nodes_paths: Array = []

var deactivated_checkpoints: Array = []

var active_checkpoint: Checkpoint

var total_diamonds: int

func _on_FreedomArea_body_entered(body):
	animation_player.play("end")
	Save.delete()

func _ready():
	
	if Save.exists():
		var deactivated_checkpoints_paths: Array = Save.get_deactivated_checkpoints_paths()
		for path in deactivated_checkpoints_paths:
			var deactivated_checkpoint: Checkpoint = get_node(path)
			deactivated_checkpoints.push_back(deactivated_checkpoint)
			deactivated_checkpoint.deactivate()
		
		deleted_nodes_paths = Save.get_deleted_nodes_paths()
		for node_path in deleted_nodes_paths:
			get_node(node_path).queue_free()
		
		var saved_active_check_point_path = Save.get_active_checkpoint_path()
		if saved_active_check_point_path != null and saved_active_check_point_path != "":
			active_checkpoint = get_node(saved_active_check_point_path)
			active_checkpoint.activate()
			player.respawn_location = active_checkpoint.global_position
		
	else:
		animation_player.play("first_scene")
	
	for child in checkpoints.get_children():
		var checkpoint_node: Checkpoint = child
# warning-ignore:return_value_discarded
		checkpoint_node.connect("activated", self, "_on_checkpoint_activated", [checkpoint_node])
		
	for child in spikes.get_children():
		var spikes_node: Area2D = child
# warning-ignore:return_value_discarded
		spikes_node.connect("body_entered", self, "_on_spikes_body_entered")
		
	for child in items.get_children():
		var item_node: Area2D = child
# warning-ignore:return_value_discarded
		item_node.connect("body_entered", self, "_on_item_body_entered", [item_node])
		
		
	for child in locked_doors.get_children():
		var locked_door_node: LockedDoor = child
		var locked_door_area_node: Area2D = locked_door_node.open_area
# warning-ignore:return_value_discarded
		locked_door_area_node.connect("body_entered", self, "_on_locked_door_area_body_entered", [child])
	
	for child in wall_guns.get_children():
		var wall_gun: WallGun = child
# warning-ignore:return_value_discarded
		wall_gun.connect("shot_bullet", self, "_on_wall_gun_shot_bullet")
	
	for child in diamonds.get_children():
		var diamond: Area2D = child
# warning-ignore:return_value_discarded
		diamond.connect("body_entered", self, "_on_diamond_body_entered", [diamond])
	
	for child in haste_potions.get_children():
		var haste_potion: HastePotion = child
# warning-ignore:return_value_discarded
		haste_potion.connect("body_entered", self, "_on_haste_potion_body_entered", [haste_potion])
	
	for child in green_gates.get_children():
		var green_gate: Area2D = child
		green_gate.connect("body_entered", self, "_on_green_gate_body_entered")
	
	total_diamonds = diamonds.get_child_count()
	player.update_diamonds_collected(total_diamonds)
	

func _on_checkpoint_activated(arg_checkpoint: Checkpoint):
	if active_checkpoint != arg_checkpoint:
		
		if active_checkpoint != null:
			active_checkpoint.deactivate()
		
		Audio.play("res://assets/sounds/checkpoint_reached.wav")
		active_checkpoint = arg_checkpoint
		player.respawn_location = arg_checkpoint.global_position
		
		save_game()
		
		
func _on_spikes_body_entered(body):
	Audio.play("res://assets/sounds/death.wav")
	player.animation_player.play("death")


func _on_item_body_entered(body, arg_item_area: ItemArea):
	Audio.play("res://assets/sounds/collect_item.wav")
	var item = Item.new()
	item.name = arg_item_area.item_name
	item.texture_path = arg_item_area.sprite.texture.get_path()
	item.color = arg_item_area.modulate
	player.add_item_to_inventory(item)
	deleted_nodes_paths.push_back(arg_item_area.get_path())
	arg_item_area.queue_free()
	
func _on_locked_door_area_body_entered(body, arg_locked_door: LockedDoor):
	for element in player.inventory:
		var item: Item = element
		if item.name == arg_locked_door.required_item:
			Audio.play("res://assets/sounds/open_door.wav")
			player.remove_item_from_inventory(item)
			deleted_nodes_paths.push_back(arg_locked_door.get_path())
			arg_locked_door.queue_free()


func _on_DoubleJump_body_entered(body):
	Audio.play("res://assets/sounds/collect_item.wav")
	deleted_nodes_paths.push_back(double_jump.get_path())
	double_jump.queue_free()
	player.double_jump = true
	player.boots_sprite.show()

func _on_Crown_body_entered(body):
	Audio.play("res://assets/sounds/collect_item.wav")
	deleted_nodes_paths.push_back(crown.get_path())
	crown.queue_free()
	player.has_crown = true
	player.crown_sprite.show()


func _on_Spikes24_body_entered(body):
	Audio.play("res://assets/sounds/death.wav")
	player.animation_player.play("death")

func _on_wall_gun_shot_bullet(arg_bullet: Bullet):
	arg_bullet.connect("body_entered", self, "_on_bullet_body_entered", [arg_bullet])

func _on_bullet_body_entered(body, arg_bullet: Bullet):
	if body is Player:
		Audio.play("res://assets/sounds/death.wav")
		player.animation_player.play("death")
	arg_bullet.queue_free()

func _on_diamond_body_entered(body, arg_diamond):
	Audio.play("res://assets/sounds/collect_diamond.wav")
	deleted_nodes_paths.push_back(arg_diamond.get_path())
	arg_diamond.queue_free()
	player.diamonds_collected += 1
	player.update_diamonds_collected(total_diamonds)


func _on_haste_potion_body_entered(body, arg_haste_potion: HastePotion):
	player.haste = arg_haste_potion.haste_time
	arg_haste_potion.consume()

func _on_green_gate_body_entered(body):
	if not player.has_crown:
		Audio.play("res://assets/sounds/death.wav")
		player.animation_player.play("death")

func _physics_process(delta):
	for child in mover_blocks.get_children():
		var mover_block: MoverBlock = child
		for body in mover_block.get_overlapping_bodies():
			if body is Player:
				player.velocity.y = min(0, player.velocity.y)
				player.jump_timer.start()
				player.move_and_slide(mover_block.get_velocity())
				
	for child in second_jumps.get_children():
		var second_jump: Area2D = child
		for body in second_jump.get_overlapping_bodies():
			if body is Player:
				if not second_jump.disabled and Input.is_action_pressed("jump") and body.controlled:
					Audio.play("res://assets/sounds/second_jump.wav", -10)
					second_jump.disable()
					player.jump_timer.start()




func _on_Rotation_body_entered(body):
	player.rotation_degrees = 180 * int(player.gravity > 0)
	player.gravity *= -1
	player.camera.zoom.y = 2.5 if player.gravity > 0 else -2.5


func save_game() -> void:
	var deactivated_checkpoints_paths: Array = []
	for element in deactivated_checkpoints:
		var deactivated_checkpoint: Checkpoint = element
		deactivated_checkpoints_paths.push_back(deactivated_checkpoint.get_path())
	Save.set_deactivated_checkpoints_paths(deactivated_checkpoints_paths)
	
	Save.set_deleted_nodes_paths(deleted_nodes_paths)
	if active_checkpoint != null:
		Save.set_active_checkpoint_path(active_checkpoint.get_path())
	Save.set_player_deaths(player.deaths)
	Save.set_player_time(player.time)
	Save.set_player_diamonds_collected(player.diamonds_collected)
	Save.set_player_global_position(player.global_position)
	Save.set_player_inventory(player.inventory)
	Save.write()

func _on_SaveExitButton_pressed():
	save_game()
	get_tree().change_scene("res://scenes/TitleScreen/TitleScreen.tscn")

func return_to_title_screen():
	get_tree().change_scene("res://scenes/TitleScreen/TitleScreen.tscn")

func _on_FreedomAreaSpace_body_entered(body):
	animation_player.play("diamonds_end")
	Save.delete()
