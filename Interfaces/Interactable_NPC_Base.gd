class_name Interactable_NPC
extends Area2D

onready var active: bool = false

func _ready():
	connect("body_entered", self, "on_interactable_body_entered")
	connect("body_exited", self, "on_interactable_body_exited")
	
func _process(delta):
	$Interact.visible = self.active

func _input(event):
	if event.is_action_pressed("interact") and self.active:
		self.interact()

func on_interactable_body_entered(body):
	if body is Player:
		self.active = true

func on_interactable_body_exited(body):
	if body is Player:
		self.active = false

func interact():
	pass
