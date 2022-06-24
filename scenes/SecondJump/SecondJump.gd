class_name SecondJump
extends Area2D

onready var cooldown_timer = $CooldownTimer
onready var animation_player = $AnimationPlayer


var second_jump_editor: SecondJumpEditor = Game.second_jump_data as SecondJumpEditor


var disabled: bool = false


var overlapping_bodies_cache: Array


func _ready():
	Game.player_body_data.connect("last_second_jumped_player_body_set", self, "_on_last_second_jumped_player_body_set")
	animation_player.play("idle")




func _on_last_second_jumped_player_body_set():
	var last_second_jumped_player_body = Game.player_body_data.last_second_jumped_player_body
	if overlapping_bodies_cache.has(last_second_jumped_player_body):
		
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
