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
	
	if(character.velocity.x == 0):
		state_machine.transition_to("Idle")
		
	character.velocity = character.move_and_slide(character.velocity, character.gravity_direction)


func enter(_msg := {}) -> void:
	character.get_node("Sprite_Run").visible = true
	character.animation.play("Run")


func exit() -> void:
	character.animation.play("Run")
	character.get_node("Sprite_Run").visible = false
