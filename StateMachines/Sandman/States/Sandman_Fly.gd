extends SandmanBaseState


func handle_input(_event: InputEvent) -> void:
	pass


func update(_delta: float) -> void:
	pass


func physics_update(_delta: float) -> void:
	character.velocity.x = character.movement_speed * character.move_direction * _delta * 100
	
	if(character.body.position.distance_to(character.target_position) < 50):
		state_machine.transition_to("Attack")
		
	character.velocity = character.body.move_and_slide(character.velocity, character.gravity_direction)


func enter(_msg := {}) -> void:
	character.animation.play("Fly")
	pass


func exit() -> void:
	character.get_node("KinematicBody2D/SpriteFly").visible = false
