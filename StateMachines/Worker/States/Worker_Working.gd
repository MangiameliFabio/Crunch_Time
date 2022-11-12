extends WorkerBaseState


func handle_input(_event: InputEvent) -> void:
	pass


func update(_delta: float) -> void:
	if character.sleep_counter <= 0:
		state_machine.transition_to("Sleeping")
	
	character.sleep_counter -= _delta
	if (character.SLEEP_AFTER_SECONDS / character.sleep_counter) >= 2:
		character.show_need_bubble = true


func physics_update(_delta: float) -> void:
	pass


func enter(_msg := {}) -> void:
	character.animation.play("Working")


func exit() -> void:
	character.get_node("Sprite_Working").visible = false
