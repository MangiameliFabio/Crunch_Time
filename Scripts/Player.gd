extends KinematicBody2D
class_name Player

export var movement_speed := 250
export var movement_speed_air := 125
export var gravity := 40
export var jump_strength := 10

var velocity := Vector2.ZERO
var gravity_direction := Vector2.UP

onready var animation = $AnimationPlayer

func _process(delta):
	if Input.get_action_strength("move_left"):
		$Sprite_Idle.set_flip_h(true)
		$Sprite_Run.set_flip_h(true)
	
	if Input.get_action_strength("move_right"):
		$Sprite_Idle.set_flip_h(false)
		$Sprite_Run.set_flip_h(false)
		


