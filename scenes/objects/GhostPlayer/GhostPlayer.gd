extends KinematicBody2D

onready var sprite = $Sprite

export(int) var speed: int = 1000

var velocity: Vector2
var displacement: Vector2

func _physics_process(delta):
	if is_moving():
		sprite.flip_h = displacement.x < 0
	
	velocity.x = ceil(Input.get_action_strength("move_right")) - ceil(Input.get_action_strength("move_left"))
	velocity.y = ceil(Input.get_action_strength("down")) - ceil(Input.get_action_strength("up"))
	
	displacement = move_and_slide(velocity * speed)



func is_moving() -> bool:
	return displacement.x > 0.1 or displacement.x < -0.1
