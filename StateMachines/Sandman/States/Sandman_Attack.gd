extends SandmanBaseState


func handle_input(_event: InputEvent) -> void:
	pass


func update(_delta: float) -> void:
	if character.sleep_timer <= 0:
		character.target.attacked_by_sandman = true
		WorldManager.sandmans.erase(character)
		character.delete()
		
	character.sleep_timer -= _delta


func physics_update(_delta: float) -> void:
	pass


func enter(_msg := {}) -> void:
	character.get_node("KinematicBody2D/SpriteAttack").visible = true
	character.animation.play("Attack")

func exit() -> void:
	pass
