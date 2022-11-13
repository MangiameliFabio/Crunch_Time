extends Node2D

const IDLE_DURATION = 1.0

export var distance = Vector2.UP * 136
export var floors = 4
export var speed := 100.0

onready var platform = $Platform
onready var tween = $Tween
onready var collision_left = $Platform/CollisionWallLeft
onready var collision_right = $Platform/CollisionWallRight

var current_position = Vector2.ZERO
var current_floor = 1

var follow = Vector2.ZERO
var enable_input = false
var player_left = false

func _process(delta):
	if Input.is_action_pressed("ui_up") and enable_input and !(current_floor >= floors):
		move_up()
		collision_left.disabled = false
		collision_right.disabled = false
		enable_input = false
		
	if Input.is_action_pressed("ui_down") and enable_input and current_floor > 1:
		move_down()
		collision_left.disabled = false
		collision_right.disabled = false
		enable_input = false
	
func move_up():
	var duration = distance.length() / speed
	tween.interpolate_property(platform, "position", current_position, distance * current_floor, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	current_position = distance * current_floor
	current_floor += 1

func move_down():
	var duration = distance.length() / speed
	current_floor -= 1
	tween.interpolate_property(platform, "position", current_position, distance * (current_floor - 1), duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	current_position = distance * (current_floor - 1)
	

#func _physics_process(delta):
#	platform.position = platform.position.linear_interpolate(follow, 0.075)


func _on_Area2D_body_entered(body):
	if body is Player:
		enable_input = true
		player_left = false


func _on_Area2D_body_exited(body):
	if body is Player:
		enable_input = false
		player_left = true

func _on_Tween_tween_all_completed():
	enable_input = true
	
	collision_left.disabled = true
	collision_right.disabled = true

