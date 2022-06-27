class_name Bullet
extends DamageArea


var direction: Vector2
var speed: float



func _physics_process(delta):
	global_position += direction * speed


func _on_Bullet_body_entered(body):
	queue_free()
