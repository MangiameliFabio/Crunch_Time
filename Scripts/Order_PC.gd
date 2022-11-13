extends Interactable_Object

onready var crate = get_parent().get_node("Crate")

func _ready():
	self.progress_bar.max_value = self.COOLDOWN_TIME

func _process(delta):
	self.progress_bar.value = self.timer

func interact():
	if self.working:
		return
	self.working = true
	$AudioStreamPlayer2D.play()
	$Interact.visible = false
	self.progress_bar.visible = true
	print ("Interacted with PC")

func cooldown_finished():
	print("Spawn crate!")
	if not crate:
		return
	crate.visible = true
	progress_bar.visible = false
