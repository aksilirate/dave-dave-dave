class_name SecondJump
extends Area2D



export(NodePath) onready var world_scene = get_node(world_scene) as WorldScene

export(Resource) var second_jump_editor = second_jump_editor as SecondJumpEditor

onready var player_body_data: PlayerBodyData = world_scene.world_data.player_body_data as PlayerBodyData


onready var cooldown_timer = $CooldownTimer
onready var animation_player = $AnimationPlayer



var disabled: bool = false


var overlapping_bodies_cache: Array





func _ready():
	player_body_data.connect("second_jumped", self, "_on_player_body_second_jumped")
	animation_player.play("idle")






func _on_player_body_second_jumped():
	var arg_body = player_body_data.body
	if overlapping_bodies_cache.has(arg_body):
		
		for element in overlapping_bodies_cache:
			var body: Node2D = element
			overlapping_bodies_cache.erase(body)
			second_jump_editor.remove_from_overlapping_bodies(body)
			
		_disable()
	


func _physics_process(delta):
	
	for element in overlapping_bodies_cache:
		var body: Node2D = element
		if not get_overlapping_bodies().has(body):
			overlapping_bodies_cache.erase(body)
			second_jump_editor.remove_from_overlapping_bodies(body)
	
	if disabled:
		return
	
	for element in get_overlapping_bodies():
		var body: Node2D = element
		if not overlapping_bodies_cache.has(body):
			overlapping_bodies_cache.push_back(body)
			second_jump_editor.add_to_overlapping_bodies(body)
	
	





func _disable():
	hide()
	disabled = true
	cooldown_timer.start()



func _enable():
	show()
	disabled = false



func _on_CooldownTimer_timeout():
	_enable()
