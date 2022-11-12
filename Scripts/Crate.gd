extends Area2D

onready var picked_up = false

func _ready():
	connect("body_entered", self, "on_pickable_body_entered")

func on_pickable_body_entered(body):
	if body is Player and self.visible:
		self.picked_up = true
		self.visible = false
		print("picked up!")
		WorldManager.cola_crate_ammount = 2

		# TODO change animation sprite?
