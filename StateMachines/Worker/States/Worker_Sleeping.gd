extends WorkerBaseState


func handle_input(_event: InputEvent) -> void:
	pass


func update(_delta: float) -> void:
	pass


func physics_update(_delta: float) -> void:
	pass


func enter(_msg := {}) -> void:
	character.clear_need_bubble()
	character.get_node("Sprite_Sleeping").visible = true
	character.animation.play("Sleeping")


func exit() -> void:
	pass
