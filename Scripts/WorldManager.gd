extends Node
const NeedType = preload("res://Scripts/NeedType.gd") 

var count_down := 120.0
var money_ammount := 0.0
var max_worker := 0.0
var coffee_can_ammount := 0
var cola_crate_ammount := 0
var worker = []
var rng = RandomNumberGenerator.new()
var select_worker_timer := 0.0

func _ready():
	rng.randomize()
	select_worker_timer = rng.randf_range(1.0,5.0)

# Count Down to finish game
func _process(delta):
	count_down -= delta
	#if count_down <= 0:
	#	print("Game Finished")
	
	if(worker.size() > 0):
		money_ammount += delta * worker.size()
	
	if(select_worker_timer <= 0):
		choose_random_worker().receive_new_need(NeedType.COLA)
		select_worker_timer = rng.randf_range(1.0,5.0)
	
	select_worker_timer -= delta

func choose_random_worker():
	return worker[rng.randi_range(0, worker.size()-1)]
	
