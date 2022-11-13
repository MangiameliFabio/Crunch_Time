extends Node
#const NeedType = preload("res://Scripts/NeedType.gd")

var max_time := 150.0
var count_down := 60.0
var money_ammount := 0.0
var max_worker := 0.0
var coffee_can_ammount := -1
var cola_crate_ammount := -1
var worker = []
var rng = RandomNumberGenerator.new()
var select_worker_timer := 5.0
var game_started := false
var game_stop_delay := 2.0
var sandman_timer_max := 30.0
var sandman_timer := 30.0
var sandmans = []
var audio_player = AudioStreamPlayer2D.new()
var rng_max := 10.0
var current_max_rng = rng_max
var rng_min := 5.0
var current_min_rng = rng_min
var difficulty = 30.0
var current_difficulty = difficulty

func _ready():
	audio_player.stream = load("res://Assets/Sounds/Office_Music.ogg")
	audio_player.autoplay = true
	count_down = max_time
	rng.randomize()

func _process(delta):
	if game_started:
		if rng_min > 0.0:
			if(current_difficulty <= 0):
				current_max_rng -= 1.0
				current_min_rng -= 1.0
				current_difficulty = difficulty
			current_difficulty -= delta
		
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
		
			select_worker_timer = rng.randf_range(current_min_rng, current_max_rng)
	
		select_worker_timer -= delta
		
		if sandman_timer <= 0:
			spawn_sandman()
			sandman_timer = rng.randf_range(10.0,15.0)
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
	select_worker_timer = 10.0
	game_stop_delay = 5
	current_max_rng = rng_min
	current_min_rng = rng_min
	current_difficulty = difficulty
	sandman_timer = sandman_timer_max


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
		if is_instance_valid(sandman):
			sandman.delete()
