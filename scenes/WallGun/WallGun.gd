class_name WallGun
extends Node2D

signal shot_bullet(bullet)

func shoot():
	var bullet = preload("res://scenes/Bullet/Bullet.tscn").instance()
	bullet.speed = 10
	bullet.direction = Vector2(1,0).rotated(rotation)
	add_child(bullet)
	emit_signal("shot_bullet", bullet)

func _on_ShootTimer_timeout():
	shoot()
