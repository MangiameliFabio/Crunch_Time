extends Interactable_NPC
class_name Worker
const NeedType = preload("res://Scripts/NeedType.gd")   

const SLEEP_AFTER_SECONDS = 10.0

var sleep_counter := SLEEP_AFTER_SECONDS
onready var animation = $AnimationPlayer as AnimationPlayer
onready var state_machine = $WorkerStateMachine
onready var current_need = NeedType.NO_NEED

func _ready():
	WorldManager.worker.append(self)

func _process(delta):
	# TODO REFACTOR THIS IF THERE IS TIME LEFT
	var current_state_name = state_machine.get_current_state_name()
	if current_need == NeedType.COLA and current_state_name == "Working":
		$Sprite_Need_Cola.visible = true
	elif current_need == NeedType.COFFEE and current_state_name == "Working":
		$Sprite_Need_Coffee.visible = true
	else:
		return

func interact():
	if WorldManager.cola_crate_ammount > 0 and state_machine.get_current_state_name() == "Working" and self.current_need:
		print("Item given!")
		WorldManager.cola_crate_ammount -= 1
		self.clear_need_bubble()
		self.current_need = NeedType.NO_NEED
		self.sleep_counter = self.SLEEP_AFTER_SECONDS
	else:
		print("You have no item to give or Worker is sleeping!")

func receive_new_need(need):
	self.current_need = need
	
func clear_need_bubble():
	$Sprite_Need_Cola.visible = false
	$Sprite_Need_Coffee.visible = false
