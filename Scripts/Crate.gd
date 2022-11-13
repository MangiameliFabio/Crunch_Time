extends Area2D

onready var picked_up = false
onready var animation = $AnimationPlayer

func _ready():
	connect("body_entered", self, "on_pickable_body_entered")
	self.animation.play("Arrow_Bounce")

func on_pickable_body_entered(body):
	if body is Player and self.visible:
		body.change_texture_crate()
		self.picked_up = true
		self.visible = false
		print("picked up!")
		WorldManager.cola_crate_ammount = 3
		WorldManager.coffee_can_ammount = 0
		self.animation.stop(true)
