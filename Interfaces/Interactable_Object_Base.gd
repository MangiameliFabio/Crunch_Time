class_name Interactable_Object
extends Area2D

const COOLDOWN_TIME: float = 1.0

onready var active: bool = false
onready var timer: float = COOLDOWN_TIME
onready var working: bool = false

func _ready():
	connect("body_entered", self, "on_interactable_object_body_entered")
	connect("body_exited", self, "on_interactable_object_body_exited")
	
func _process(delta):
	if not self.working:
		$Interact.visible = self.active
	else:
		self.timer -= delta
		if self.timer <= 0:
			self.working = false
			$Cooldown.visible = false
			self.timer = COOLDOWN_TIME
			self.cooldown_finished()

func _input(event):
	if event.is_action_pressed("interact") and self.active:
		self.interact()

func on_interactable_object_body_entered(body):
	if body is Player:
		self.active = true

func on_interactable_object_body_exited(body):
	if body is Player:
		self.active = false

func interact():
	pass

func cooldown_finished():
	pass
