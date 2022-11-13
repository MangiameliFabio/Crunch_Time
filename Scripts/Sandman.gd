extends Node
class_name Sandman

onready var animation = $KinematicBody2D/AnimationPlayer
onready var body = $KinematicBody2D as KinematicBody2D
onready var sprite_fly = $KinematicBody2D/SpriteFly as Sprite
onready var sprite_attack = $KinematicBody2D/SpriteAttack as Sprite

var movement_speed = 10.0
var target : Worker
var target_position := Vector2.ZERO
var velocity := Vector2.ZERO
var gravity_direction := Vector2.UP
var move_direction := 1
var sleep_timer := 5.0

func _ready():
	WorldManager.sandmans.append(self)
	target.current_need = NeedType.SANDMAN
	target_position = target.position
	if target_position.x < 0:
		body.position.y = target_position.y - 20
		body.position.x = -470.0
		move_direction = 1	
	else:
		sprite_fly.set_flip_h(true)
		sprite_attack.set_flip_h(true)		
		body.position.y = target_position.y - 20
		body.position.x = 470.0 
		move_direction = -1	

func _process(delta):
	pass

func delete():
	target.current_need = NeedType.NO_NEED
	queue_free()
