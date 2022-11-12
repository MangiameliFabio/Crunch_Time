extends Area2D
class_name Worker

var sleep_counter := 1.0
onready var animation = $AnimationPlayer as AnimationPlayer

func _ready():
	WorldManager.worker.append(self)
	WorldManager.max_worker += 1
