extends KinematicBody2D
class_name Player

const NormalTextureIdle = preload("res://Assets/Sprites/Player/GraphicsPlayerIdle.png")
const NormalTextureRun = preload("res://Assets/Sprites/Player/GraphicsPlayerRun.png")
const CoffeePotTextureIdle = preload("res://Assets/Sprites/Player/GraphicsPlayerIdleCoffeePot.png")
const CoffeePotTextureRun = preload("res://Assets/Sprites/Player/GraphicsPlayerRunCoffeePot.png")
const CrateTextureIdle = preload("res://Assets/Sprites/Player/GraphicsPlayerIdleCrate.png")
const CrateTextureRun = preload("res://Assets/Sprites/Player/GraphicsPlayerRunCrate.png")

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

func change_texture_normal():
	$Sprite_Idle.set_texture(NormalTextureIdle)
	$Sprite_Run.set_texture(NormalTextureRun)

func change_texture_coffee_pot():
	$Sprite_Idle.set_texture(CoffeePotTextureIdle)
	$Sprite_Run.set_texture(CoffeePotTextureRun)

func change_texture_crate():
	$Sprite_Idle.set_texture(CrateTextureIdle)
	$Sprite_Run.set_texture(CrateTextureRun)

