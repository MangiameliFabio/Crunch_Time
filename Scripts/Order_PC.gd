extends Interactable

onready var crate = get_parent().get_node("Crate")

func interact():
	if self.working:
		return
	
	self.working = true
	$ExclamationMark.visible = false
	$Cooldown.visible = true
	print ("Interacted with PC")

func cooldown_finished():
	print("Spawn crate!")
	if not crate:
		return
	crate.visible = true
