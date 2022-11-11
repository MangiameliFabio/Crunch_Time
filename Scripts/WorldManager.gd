extends Node

var count_down := 120.0
var money_ammount := 0.0
var worker_count := 0
var coffee_can_ammount := 0
var cola_crate_ammount := 0

# Count Down to finish game
func _process(delta):
	count_down -= delta
	if count_down <= 0:
		print("Game Finished")
	
	if(worker_count > 0):
		money_ammount += delta * worker_count
