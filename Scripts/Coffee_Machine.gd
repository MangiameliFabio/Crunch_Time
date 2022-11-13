extends Interactable_Object

onready var picked_up = false
onready var coffee_ready = false
onready var animation = $AnimationPlayer

func _ready():
	connect("body_entered", self, "on_pickable_body_entered")
	connect("body_exited", self, "on_pickable_body_exited")
	self.progress_bar.max_value = self.COOLDOWN_TIME

func _process(delta):
	self.progress_bar.value = self.timer

func on_pickable_body_entered(body):
	if body is Player and self.coffee_ready:
		self.pickup_coffee_can(body)

func on_pickable_body_exited(body):
	if body is Player and self.coffee_ready:
		self.active = false
		self.pickup_coffee_can(body)

func interact():
	self.coffee_ready = false
	if self.working:
		return
	self.working = true
	$Interact.visible = false
	self.progress_bar.visible = true
	self.show_coffee_processing()
	print ("Interacted with Coffe Machine")

func cooldown_finished():
	print("Spawn coffee!")
	self.coffee_ready = true
	self.show_coffee_ready()
	$Arrow.visible = true
	self.animation.play("Arrow_Bounce")
	
func pickup_coffee_can(body):
	print("picked up!")
	self.picked_up = true
	body.change_texture_coffee_pot()
	self.show_coffee_empty()
	$Arrow.visible = false
	WorldManager.coffee_can_ammount = 3
	WorldManager.cola_crate_ammount = -1
	self.coffee_ready = false
	self.animation.stop(true)
	
func show_coffee_empty():
	$Sprite_Coffee_Machine_Empty.visible = true
	$Sprite_Coffee_Machine_Processing.visible = false
	$Sprite_Coffee_Machine_Ready.visible = false
	
func show_coffee_processing():
	$Sprite_Coffee_Machine_Empty.visible = false
	$Sprite_Coffee_Machine_Processing.visible = true
	$Sprite_Coffee_Machine_Ready.visible = false
	
func show_coffee_ready():
	$Sprite_Coffee_Machine_Processing.visible = false
	$Sprite_Coffee_Machine_Ready.visible = true
