extends Interactable_Object

onready var picked_up = false
onready var coffee_ready = false

func _ready():
	connect("body_entered", self, "on_pickable_body_entered")

func on_pickable_body_entered(body):
	if body is Player and self.coffee_ready:
		print("picked up!")
		self.picked_up = true
		$Sprite_Coffee_Machine_Empty.visible = true
		$Sprite_Coffee_Machine_Processing.visible = false
		$Sprite_Coffee_Machine_Ready.visible = false
		WorldManager.coffee_can_ammount = 3
		WorldManager.cola_crate_ammount = 0
		self.coffee_ready = false

func interact():
	self.coffee_ready = false
	
	if self.working:
		return
	self.working = true
	$Interact.visible = false
	$Cooldown.visible = true
	$Sprite_Coffee_Machine_Empty.visible = false
	$Sprite_Coffee_Machine_Processing.visible = true
	$Sprite_Coffee_Machine_Ready.visible = false
	print ("Interacted with Coffe Machine")

func cooldown_finished():
	print("Spawn coffee!")
	self.coffee_ready = true
	$Sprite_Coffee_Machine_Processing.visible = false
	$Sprite_Coffee_Machine_Ready.visible = true
