extends Node


onready var animation_player = $AnimationPlayer

onready var checkpoints = $World/Checkpoints
onready var spikes = $World/Spikes
onready var items = $World/Items
onready var locked_doors = $World/LockedDoors
onready var moving_platforns = $World/MovingPlatforms
onready var second_jumps = $World/SecondJumps
onready var player = $World/Player


var deactivated_checkpoints: Array = []

var active_checkpoint: Checkpoint


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
