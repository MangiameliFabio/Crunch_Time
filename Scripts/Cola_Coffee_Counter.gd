extends Label

func _process(delta):
	if WorldManager.cola_crate_ammount > 0:
		text = "Cola: " + str(int(WorldManager.cola_crate_ammount))
	elif WorldManager.coffee_can_ammount > 0:
		text = "Coffee: " + str(int(WorldManager.coffee_can_ammount))
