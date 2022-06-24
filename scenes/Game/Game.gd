extends Node

onready var world = $World
onready var animation_player = $AnimationPlayer
onready var checkpoints = $World/Checkpoints
onready var items = $World/Items
onready var locked_doors = $World/LockedDoors
onready var moving_platforns = $World/MovingPlatforms
onready var wall_guns = $World/WallGuns
onready var diamonds = $World/Diamonds
onready var mover_blocks = $World/MoverBlocks
onready var double_jump = $World/DoubleJump
onready var crown = $World/Crown
onready var player = $World/Player
onready var haste_potions = $World/HastePotions
onready var green_gates = $World/GreenGates
onready var tile_map = $World/TileMap
onready var tile_map_2 = $World/TileMap2
onready var secret_tiles = $World/SecretTiles
onready var red_man = $World/RedMan
onready var red_man_3 = $World/RedMan3
onready var red_man_4 = $World/RedMan4
onready var ambient_player = $AnmbientPlayer
onready var diamond_texture = $World/Player/CanvasLayer/HBoxContainer/DiamondsLabel/DiamondTextureRect
onready var pet_chamber = $World/PetChamber
onready var pause_menu = $CanvasLayer/PauseMenu



var deleted_nodes_paths: Array = []

var deactivated_checkpoints: Array = []

var active_checkpoint: Checkpoint

var total_diamonds: int


var original_spawn_position: Vector2


func _on_FreedomArea_body_entered(body):
	if Globals.ghost_mode:
		return
		
	if player.deaths >= 1000:
		animation_player.play("end_red")
	else:
		animation_player.play("end")
		
	Steamworks.unlock_achievement("FREEDOM_WAS_A_LIE")
	Stats.set_ghost_mode_enabled(true)
	Stats.set_completed(true)
	Stats.set_deaths(player.deaths)
	Stats.set_time(player.time)
	Stats.write()
	Save.delete()




func _ready():
	original_spawn_position = player.global_position
	player.respawn_location = original_spawn_position
	
	if not Globals.ghost_mode:
		if not Globals.zero_deaths_mode:
			player.animation_player.connect("animation_finished", self, "_on_player_animation_finished")
		
		for child in checkpoints.get_children():
			var checkpoint_node: Checkpoint = child
			if Globals.zero_deaths_mode:
				checkpoint_node.queue_free()
				continue
		# warning-ignore:return_value_discarded
			checkpoint_node.connect("activated", self, "_on_checkpoint_activated", [checkpoint_node])
			
			
		for child in items.get_children():
			var item_node: Area2D = child
		# warning-ignore:return_value_discarded
			item_node.connect("body_entered", self, "_on_item_body_entered", [item_node])
			
			
		for child in locked_doors.get_children():
			var locked_door_node: LockedDoor = child
			var locked_door_area_node: Area2D = locked_door_node.open_area
		# warning-ignore:return_value_discarded
			locked_door_area_node.connect("body_entered", self, "_on_locked_door_area_body_entered", [child])

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
			
		if not Save.exists() and not Globals.zero_deaths_mode:
			animation_player.play("first_scene")
		
	
	
	if Globals.ghost_mode:
		var ghost_player = preload("res://scenes/GhostPlayer/GhostPlayer.tscn").instance()
		world.add_child(ghost_player)
		ghost_player.global_position = player.global_position
		player.queue_free()
	
	
	if Save.exists() or Globals.ghost_mode or Globals.zero_deaths_mode:
		red_man.queue_free()
	
	
	if Save.exists() and not Globals.zero_deaths_mode:
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
	
	for child in wall_guns.get_children():
		var wall_gun: WallGun = child
	# warning-ignore:return_value_discarded
		wall_gun.connect("shot_bullet", self, "_on_wall_gun_shot_bullet")

	update_death_effects()
	

	total_diamonds = diamonds.get_child_count()
	player.update_diamonds_collected(total_diamonds)
	

func _on_checkpoint_activated(arg_checkpoint: Checkpoint):
	if active_checkpoint != arg_checkpoint:
		
		if active_checkpoint != null:
			active_checkpoint.deactivate()
		
		Audio.play("res://assets/sounds/checkpoint_reached.wav")
		active_checkpoint = arg_checkpoint
		player.respawn_location = arg_checkpoint.global_position
		
		if not Globals.ghost_mode and not Globals.zero_deaths_mode:
			save_game()
		
		


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
			if arg_locked_door.name == "GrayLockedDoor":
				animation_player.play("open cage scene")
				deleted_nodes_paths.push_back(red_man_3.get_path())
			deleted_nodes_paths.push_back(arg_locked_door.get_path())
			arg_locked_door.queue_free()
			
			

func _on_DoubleJump_body_entered(body):
	Audio.play("res://assets/sounds/collect_item.wav")
	Steamworks.unlock_achievement("DOUBLE_JUMP")
	deleted_nodes_paths.push_back(double_jump.get_path())
	double_jump.queue_free()
	player.double_jump = true
	player.boots_sprite.show()

func _on_Crown_body_entered(body):
	Audio.play("res://assets/sounds/collect_item.wav")
	Steamworks.unlock_achievement("A_CROWN")
	deleted_nodes_paths.push_back(crown.get_path())
	crown.queue_free()
	player.has_crown = true
	player.crown_sprite.show()



func _on_wall_gun_shot_bullet(arg_bullet: Bullet):
	arg_bullet.connect("body_entered", self, "_on_bullet_body_entered", [arg_bullet])




func _on_bullet_body_entered(body, arg_bullet: Bullet):
	if body is PlayerBody:
		Audio.play("res://assets/sounds/death.wav")
		player.animation_player.play("death")
		
		
	arg_bullet.queue_free()





func _on_diamond_body_entered(body, arg_diamond):
	Audio.play("res://assets/sounds/collect_diamond.wav")
	deleted_nodes_paths.push_back(arg_diamond.get_path())
	arg_diamond.queue_free()
	player.diamonds_collected += 1
	Steamworks.unlock_achievement("FIRST_DIAMOND")
	if player.diamonds_collected == total_diamonds:
		Steamworks.unlock_achievement("DIAMOND_RUSH")
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
			if body is PlayerBody:
				player.velocity.y = min(0, player.velocity.y)
				player.jump_timer.start()
				player.move_and_slide(mover_block.get_velocity())
				

	player.pet_body.target_location = player.pet_position.global_position
	for body in pet_chamber.get_overlapping_bodies():
		if body is PlayerBody:
			player.pet_body.target_location = pet_chamber.global_position + Vector2(0,-164)








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
	else:
		Save.set_active_checkpoint_path("")
	Save.set_player_global_position(player.global_position)
		
		
	Save.set_player_deaths(player.deaths)
	Save.set_player_time(player.time)
	Save.set_player_double_jump(player.double_jump)
	Save.set_player_crown(player.has_crown)
	Save.set_player_diamonds_collected(player.diamonds_collected)
	Save.set_player_inventory(player.inventory)
	Save.set_pet_unlocked(player.pet_body.unlocked)
	Save.write()
	
	
	Stats.set_completed(false)
	Stats.set_deaths(player.deaths)
	Stats.set_time(player.time)
	Stats.write()
	
	
	
	
	
func _on_SaveExitButton_pressed():
	if not Globals.ghost_mode and not Globals.zero_deaths_mode:
		save_game()
		
	get_tree().change_scene("res://scenes/TitleScreen/TitleScreen.tscn")





func return_to_title_screen():
	get_tree().change_scene("res://scenes/TitleScreen/TitleScreen.tscn")





func _on_FreedomAreaSpace_body_entered(body):
	if Globals.ghost_mode:
		return
	
	if player.deaths >= 1000:
		animation_player.play("diamonds_end_red")
	else:
		animation_player.play("diamonds_end")
		
	Steamworks.unlock_achievement("FREEDOM")
	Stats.set_ghost_mode_enabled(true)
	Stats.set_completed(true)
	Stats.set_deaths(player.deaths)
	Stats.set_time(player.time)
	Stats.write()
	Save.delete()


func _on_DiamondGate_body_entered(body):
	if player.diamonds_collected != total_diamonds:
		Audio.play("res://assets/sounds/death.wav")
		player.animation_player.play("death")



func _on_player_animation_finished(anim_name):
	if anim_name == "death":
		update_death_effects()



func update_death_effects():
	if player.deaths >= 500:
		var reverse_ambient_audio = preload("res://assets/sounds/ambient_reversed.wav")
		if ambient_player.stream != reverse_ambient_audio:
			ambient_player.stream = reverse_ambient_audio
	if player.deaths >= 1500:
		for child in diamonds.get_children():
			var diamond: Node2D = child
			diamond.modulate = Color("#f80000")
		diamond_texture.modulate = Color("#f80000")
	if player.deaths >= 2000:
		tile_map.modulate = Color("#f80000")
		tile_map_2.modulate = Color("#f80000")
		secret_tiles.modulate = Color("#f80000")


func _on_Sign17_body_entered(body):
	if body is PlayerBody:
		Steamworks.unlock_achievement("WHO_IS_DAVE")



func _on_PetChamber_body_entered(body):
	var colors = [
		Color.white, 
		Color("f8f800"),
		Color("f800f8"),
		Color("00f800"),
		Color("c0c0c0"),
		Color("00f8f8"),
		Color("808000"),
		]
	var texture_paths = [
		"res://assets/textures/pet_0.png",
		"res://assets/textures/pet_1.png",
		"res://assets/textures/pet_2.png",
		"res://assets/textures/pet_3.png",
		"res://assets/textures/pet_4.png",
		"res://assets/textures/pet_5.png",
		"res://assets/textures/pet_6.png",
		"res://assets/textures/pet_7.png",
		"res://assets/textures/pet_8.png",
		"res://assets/textures/pet_9.png",
		"res://assets/textures/pet_10.png",
	]
	if body is PlayerBody:
		Audio.play("res://assets/sounds/pet_summon.wav", -10)
		player.pet_body.global_position = pet_chamber.global_position + Vector2(0,-164)
		randomize()
		colors.shuffle()
		texture_paths.shuffle()
		body.pet_body.unlocked = true
		body.pet_body.visible = !Options.get_hide_pet()
		body.pet_body.modulate = colors[0]
		body.pet_body.texture = load(texture_paths[0])
		Save.set_pet_color(colors[0])
		Save.set_pet_texture_path(texture_paths[0])
		Save.set_pet_unlocked(true)
		Save.write()
			


func _on_PauseMenu_visibility_changed():
	player.controlled = true
	if pause_menu.visible:
		player.controlled = false


func _on_RedMan4_died():
	deleted_nodes_paths.push_back(red_man_4.get_path())
