extends SandmanBaseState


func handle_input(_event: InputEvent) -> void:
	pass


func update(_delta: float) -> void:
	pass


func physics_update(_delta: float) -> void:
	pass


func enter(_msg := {}) -> void:
	character.get_node("SpriteAttack").visible = true
	character.animation.play("Attack")

func exit() -> void:
	pass
