extends Label

func _process(delta):
	text = str(int(WorldManager.worker.size()))
