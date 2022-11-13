extends Label

func _process(delta):
	if WorldManager.cola_crate_ammount >= 0:
		text = str(int(WorldManager.cola_crate_ammount))
		$Sprite_Cola.visible = true
		$Sprite_Coffee.visible = false
	elif WorldManager.coffee_can_ammount >= 0:
		text = str(int(WorldManager.coffee_can_ammount))
		$Sprite_Cola.visible = false
		$Sprite_Coffee.visible = true
