extends PlayerBaseState


func handle_input(_event: InputEvent) -> void:
	if _event.is_action_pressed("jump") and character.is_on_floor():
		state_machine.transition_to("Jump")

func update(_delta: float) -> void:
	#if character.is_on_floor() and Input.get_action_strength("jump"):
	#	state_machine.transition_to("Jump")
	
	if not (Input.get_action_strength("move_right") and Input.get_action_raw_strength("move_left")):
		if Input.get_action_strength("move_right") or Input.get_action_raw_strength("move_left"):
			state_machine.transition_to("Run")

func physics_update(_delta: float) -> void:
	character.velocity.y += character.gravity * _delta * 100
	character.velocity = character.move_and_slide(character.velocity, character.gravity_direction)

func enter(_msg := {}) -> void:
	print("Enter Player Idle State")
	character.velocity.x = 0

func exit() -> void:
	print("Exit Player Idle State")
