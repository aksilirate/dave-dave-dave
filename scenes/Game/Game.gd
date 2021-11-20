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
onready var player = $World/Player


var deactivated_checkpoints: Array = []

var active_checkpoint: Checkpoint

var total_diamonds: int

func _on_FreedomArea_body_entered(body):
	animation_player.play("end")


func _ready():
	for child in checkpoints.get_children():
		var checkpoint_node: Checkpoint = child
		checkpoint_node.connect("activated", self, "_on_checkpoint_activated", [checkpoint_node])
		
	for child in spikes.get_children():
		var spikes_node: Area2D = child
		spikes_node.connect("body_entered", self, "_on_spikes_body_entered")
		
	for child in items.get_children():
		var item_node: Area2D = child
		item_node.connect("body_entered", self, "_on_item_body_entered", [item_node])
	
	for child in locked_doors.get_children():
		var locked_door_node: LockedDoor = child
		var locked_door_area_node: Area2D = locked_door_node.open_area
		locked_door_area_node.connect("body_entered", self, "_on_locked_door_area_body_entered", [child])
	
#	for child in moving_platforns.get_children():
#		var moving_platform: MovingPlatform = child
#		var detection_area: Area2D = moving_platform.detection_area

	for child in second_jumps.get_children():
		var second_jump_node: Area2D = child
		second_jump_node.connect("body_entered", self, "_on_second_jump_body_entered", [child])
	
	for child in wall_guns.get_children():
		var wall_gun: WallGun = child
		wall_gun.connect("shot_bullet", self, "_on_wall_gun_shot_bullet")
	
	for child in diamonds.get_children():
		var diamond: Area2D = child
		diamond.connect("body_entered", self, "_on_diamond_body_entered", [diamond])
		
	total_diamonds = diamonds.get_child_count()
	player.update_diamonds_collected(total_diamonds)
	animation_player.play("first_scene")


func _on_checkpoint_activated(arg_checkpoint: Checkpoint):
	if active_checkpoint != arg_checkpoint:
		
		if active_checkpoint != null:
			active_checkpoint.deactivate()
		
		active_checkpoint = arg_checkpoint
		player.respawn_location = arg_checkpoint.global_position

func _on_spikes_body_entered(body):
	player.respawn()


func _on_item_body_entered(body, arg_item_area: ItemArea):
	var item = Item.new()
	item.name = arg_item_area.item_name
	item.texture_path = arg_item_area.sprite.texture.get_path()
	item.color = arg_item_area.modulate
	player.add_item_to_inventory(item)
	arg_item_area.queue_free()
	
func _on_locked_door_area_body_entered(body, arg_locked_door: LockedDoor):
	for element in player.inventory:
		var item: Item = element
		if item.name == arg_locked_door.required_item:
			player.remove_item_from_inventory(item)
			arg_locked_door.queue_free()

func _on_second_jump_body_entered(body, arg_second_jump: SecondJump):
	if not arg_second_jump.disabled:
		arg_second_jump.disable()
		player.jump_timer.start()


func _on_DoubleJump_body_entered(body):
	double_jump.queue_free()
	player.double_jump = true
	player.boots_sprite.show()


func _on_Spikes24_body_entered(body):
	player.respawn()

func _on_wall_gun_shot_bullet(arg_bullet: Bullet):
	arg_bullet.connect("body_entered", self, "_on_bullet_body_entered", [arg_bullet])

func _on_bullet_body_entered(body, arg_bullet: Bullet):
	if body is Player:
		body.respawn()
	arg_bullet.queue_free()

func _on_diamond_body_entered(body, arg_diamond):
	arg_diamond.queue_free()
	player.diamonds_collected += 1
	player.update_diamonds_collected(total_diamonds)



func _physics_process(delta):
	for child in mover_blocks.get_children():
		var mover_block: MoverBlock = child
		for body in mover_block.get_overlapping_bodies():
			if body is Player:
				player.velocity.y = min(0, player.velocity.y)
				player.jump_timer.start()
				player.move_and_slide(mover_block.get_velocity())

