extends PlayerBaseState


func handle_input(_event: InputEvent) -> void:
	pass

func update(_delta: float) -> void:
	pass


func physics_update(_delta: float) -> void:
	var input_direction_x: float = (
		Input.get_action_strength("move_right")
		- Input.get_action_strength("move_left")
	)
	
	character.velocity.x = character.movement_speed * input_direction_x * _delta * 100
	character.velocity.y += character.gravity * _delta * 100
	character.velocity = character.move_and_slide(character.velocity, character.gravity_direction)
	
	if character.is_on_floor():
		state_machine.transition_to("Idle")


func enter(_msg := {}) -> void:
	print("Enter Player Jump State")
	character.velocity.y -= character.jump_strength * 100


func exit() -> void:
	print("Exit Player Jump State")
