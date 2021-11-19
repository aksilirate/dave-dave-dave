class_name MovingPlatform
extends Node2D

const IDLE_DURATION = 1.0

onready var kinematic_body = $KinematicBody2D
onready var position_2d = $Position2D
onready var tween = $Tween
onready var detection_area = $KinematicBody2D/Area2D

export(int) var speed = 50
export(bool) var start_with_player = false

var follow = Vector2.ZERO
var started: bool = false

func _ready():
	if not start_with_player and not started:
		start_platform()


func start_platform():
	started = true
	var goal = position_2d.position
	var duration = goal.length() / float(speed)
	
	tween.interpolate_property(self, "follow", Vector2.ZERO, goal, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, IDLE_DURATION)
	tween.interpolate_property(self, "follow", goal, Vector2.ZERO, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, duration + (IDLE_DURATION * 2))
	
	tween.start()


func _physics_process(delta):
	kinematic_body.position = kinematic_body.position.linear_interpolate(follow, 0.075)

func _on_Area2D_body_entered(body):
	if start_with_player and not started:
		start_platform()
