extends WorkerBaseState


func handle_input(_event: InputEvent) -> void:
	pass


func update(_delta: float) -> void:		
	if !(character.current_need == character.NeedType.NO_NEED):
		if character.sleep_counter <= 0:
			state_machine.transition_to("Sleeping")

		character.sleep_counter -= _delta


func physics_update(_delta: float) -> void:
	pass


func enter(_msg := {}) -> void:
	character.animation.play("Working")


func exit() -> void:
	character.get_node("Sprite_Working").visible = false
	WorldManager.worker.erase(character)
