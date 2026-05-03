extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	player.label_state.text = "HURT"
	print("HURT")
	player.animation_player.play("Hurt")

func physics_update(_delta: float) -> void:
	await player.animation_player.finished
	finished.emit("Idle")
	
	player.move_and_slide()
