extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	player.label_state.text = "FALL"
	print("FALL")

func physics_update(_delta: float) -> void:
	player.velocity += player.get_gravity() * _delta
	
	var input_direction_x := Input.get_axis("A", "D")
	player.animation_player.flip_h = true if input_direction_x < 0 else false if input_direction_x > 0 else player.animation_player.flip_h
	player.velocity.x = player.SPEED * input_direction_x

	if player.is_on_floor() and input_direction_x == 0:
		finished.emit("Idle")
	
	if player.is_on_floor() and input_direction_x != 0:
		finished.emit("Walk")
		
	player.move_and_slide()
	
	if Input.is_action_just_pressed("Jump"):
		$JumpBuffer.start()

	if player.is_on_floor():
		if not $JumpBuffer.is_stopped():
			$JumpBuffer.stop()
			finished.emit("Jump")
		elif player.velocity.x != 0:
			finished.emit("Walk")
		else:
			finished.emit("Idle")
