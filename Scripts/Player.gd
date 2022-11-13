extends KinematicBody2D
class_name Player

const NormalTextureIdle = preload("res://Assets/Sprites/Player/GraphicsPlayerIdle.png")
const NormalTextureRun = preload("res://Assets/Sprites/Player/GraphicsPlayerRun.png")
const CoffeePotTextureIdle = preload("res://Assets/Sprites/Player/GraphicsPlayerIdleCoffeePot.png")
const CoffeePotTextureRun = preload("res://Assets/Sprites/Player/GraphicsPlayerRunCoffeePot.png")
const CrateTextureIdle = preload("res://Assets/Sprites/Player/GraphicsPlayerIdleCrate.png")
const CrateTextureRun = preload("res://Assets/Sprites/Player/GraphicsPlayerRunCrate.png")
const CrateTextureAttack = preload("res://Assets/Sprites/Player/GraphicsPlayerAttackCoke.png")
const CoffeePotTextureAttack = preload("res://Assets/Sprites/Player/GraphicsPlayerAttackCoffeePot.png")

export var movement_speed := 250
export var movement_speed_air := 125
export var gravity := 40
export var jump_strength := 10

var velocity := Vector2.ZERO
var gravity_direction := Vector2.UP

onready var animation = $AnimationPlayer

func _process(delta):
	if $RayCast2D.enabled and $RayCast2D.get_collider() and ($RayCast2D.get_collider().owner is Sandman):
		$RayCast2D.get_collider().owner.delete()
		
	if Input.get_action_strength("move_left"):
		$Sprite_Idle.set_flip_h(true)
		$Sprite_Run.set_flip_h(true)
		$Sprite_Attack.set_flip_h(true)
		$RayCast2D.scale.x = -1
	
	if Input.get_action_strength("move_right"):
		$Sprite_Idle.set_flip_h(false)
		$Sprite_Run.set_flip_h(false)
		$Sprite_Attack.set_flip_h(false)
		$RayCast2D.scale.x = 1
		
	if WorldManager.cola_crate_ammount == 0 and WorldManager.coffee_can_ammount == 0:
		change_texture_normal()

func change_texture_normal():
	$Sprite_Idle.set_texture(NormalTextureIdle)
	$Sprite_Run.set_texture(NormalTextureRun)

func change_texture_coffee_pot():
	$Sprite_Idle.set_texture(CoffeePotTextureIdle)
	$Sprite_Run.set_texture(CoffeePotTextureRun)
	$Sprite_Attack.set_texture(CoffeePotTextureAttack)

func change_texture_crate():
	$Sprite_Idle.set_texture(CrateTextureIdle)
	$Sprite_Run.set_texture(CrateTextureRun)
	$Sprite_Attack.set_texture(CrateTextureAttack)

func activate_collision():
	$RayCast2D.enabled = true

func deactivate_collision():
	$RayCast2D.enabled = false
