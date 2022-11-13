extends Label

func _ready():
	text = "€ " + str(int(WorldManager.money_ammount))
