class_name PlayerStateMachine
extends Node

onready var character:= owner as Player

export var initial_state := NodePath()

var state = null
signal interaction

func _ready() -> void:
	yield(owner, "ready")
	
	#Check if initial_state is valid and assign it. 
	if(has_node(initial_state)):
		state = get_node(initial_state)
	else:
		printerr("Wrong inital state on " + character.name + "StateMachine Node")
		return
	
	#Assign state_machine and character to children
	for child in get_children():
		child.state_machine = self
		child.character = character
	
	state.enter()

#Handle user inputs
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("attack") and ((WorldManager.coffee_can_ammount > 0) or (WorldManager.cola_crate_ammount > 0)):
		transition_to("Attack")
	state.handle_input(event)


func _process(delta: float) -> void:
	state.update(delta)


func _physics_process(delta: float) -> void:
	state.physics_update(delta)


#Transition to new state.
#Inputs:
#	target_state_name -> Insert name of the state node in which should be transitioned into
#	msg -> Additional informations for the new state
func transition_to(target_state_name: String, msg: Dictionary = {}) -> void:
	if not has_node(target_state_name):
		return

	state.exit()
	state = get_node(target_state_name)
	state.enter(msg)
