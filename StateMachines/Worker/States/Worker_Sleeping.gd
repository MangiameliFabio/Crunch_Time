extends WorkerBaseState


func handle_input(_event: InputEvent) -> void:
	pass


func update(_delta: float) -> void:
	pass


func physics_update(_delta: float) -> void:
	pass


func enter(_msg := {}) -> void:
	character.get_node("Sprite_Sleeping").visible = true
	character.animation.play("Sleeping")
	character.show_need_bubble = false


func exit() -> void:
	pass
