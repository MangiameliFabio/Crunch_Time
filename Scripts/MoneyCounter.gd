extends Label

func _process(delta):
	text = "€ " + str(int(WorldManager.money_ammount))
