extends Node
#const NeedType = preload("res://Scripts/NeedType.gd")

var max_time := 150.0
var count_down := 60.0
var money_ammount := 0.0
var max_worker := 0.0
var coffee_can_ammount := 0
var cola_crate_ammount := 0
var worker = []
var rng = RandomNumberGenerator.new()
var select_worker_timer := 0.0
var game_started := false
var game_stop_delay := 2.0
var sandman_timer := 0.0
var sandmans = []

func _ready():
	count_down = max_time
	rng.randomize()
	select_worker_timer = rng.randf_range(1.0,5.0)
	sandman_timer = rng.randf_range(1.0,5.0)

func _process(delta):
	if game_started:
		count_down -= delta
	
		if count_down <= 0:
			get_tree().change_scene("res://Scene/GameOverScreen.tscn")
			game_started = false
	
		if(worker.size() > 0):
			money_ammount += delta * worker.size()
		else:
			if game_stop_delay <= 0:
				delete_all_sandmans()
				get_tree().change_scene("res://Scene/GameOverScreen.tscn")
				game_started = false
			else:
				game_stop_delay -= delta
	
		if(select_worker_timer <= 0):
			var random_worker = choose_random_worker()
			if random_worker:
				random_worker.receive_new_need(rng.randi_range(1, 2))
		
			select_worker_timer = rng.randf_range(1.0,5.0)
	
		select_worker_timer -= delta
		
		if sandman_timer <= 0:
			spawn_sandman()
			sandman_timer = rng.randf_range(10.0,20.0)
		else:
			sandman_timer -= delta

func choose_random_worker():
	worker.shuffle()
	for w in worker:
		if w.current_need == NeedType.NO_NEED:
			return w
	return null
	
func reset_game():
	count_down = max_time
	money_ammount = 0.0
	coffee_can_ammount = 0
	cola_crate_ammount = 0
	worker = []
	sandmans = []
	select_worker_timer = rng.randf_range(1.0,5.0)
	game_stop_delay = 5


func spawn_sandman():
	if !worker.empty():
		var scene = load("res://Scene/Sandman.tscn")
		var sandman = scene.instance() as Sandman
		#find target
		worker.shuffle()
		sandman.target = worker[rng.randi_range(0, worker.size() -1)]
		get_tree().root.call_deferred("add_child", sandman)

func delete_all_sandmans():
	for sandman in sandmans:
		sandman.delete()
