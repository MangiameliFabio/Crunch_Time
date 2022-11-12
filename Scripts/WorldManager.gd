extends Node

var count_down := 120.0
var money_ammount := 0.0
var max_worker := 0.0
var coffee_can_ammount := 0
var cola_crate_ammount := 0
var worker = []
var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()

# Count Down to finish game
func _process(delta):
	count_down -= delta
	#if count_down <= 0:
	#	print("Game Finished")
	
	if(worker.size() > 0):
		money_ammount += delta * worker.size()

#func choose_random_worker():
#	var worker_found = false
#	while !worker_found:
#		if !worker[rng.randf_range(0, worker.size()-1)].current_need:
#			return worker[rng.randf_range(0, worker.size()-1)]
#			worker_found = true
