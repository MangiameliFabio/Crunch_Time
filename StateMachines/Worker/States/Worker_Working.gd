extends WorkerBaseState


func handle_input(_event: InputEvent) -> void:
	pass


func update(_delta: float) -> void:
	if character.attacked_by_sandman:
		state_machine.transition_to("Sleeping")
	if !(character.current_need == character.NeedType.SANDMAN):
		if !(character.current_need == character.NeedType.NO_NEED):
			if character.sleep_counter <= 0:
				state_machine.transition_to("Sleeping")

			character.sleep_counter -= _delta
	else:
		character.sleep_counter = character.SLEEP_AFTER_SECONDS


func physics_update(_delta: float) -> void:
	pass


func enter(_msg := {}) -> void:
	character.animation.play("Working")


func exit() -> void:
	character.get_node("Sprite_Working").visible = false
	WorldManager.worker.erase(character)
