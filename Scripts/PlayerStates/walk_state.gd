extends PlayerState

var was_on_floor: bool = true

func enter(_previous_state_path: String, _data := {}) -> void:
	player.label_state.text = "WALK"
	print("WALK")
	player.animation_player.play("Walk")
	was_on_floor = true

func physics_update(_delta: float) -> void:
	var input_direction_x := Input.get_axis("A", "D")
	player.move_and_slide()
	player.velocity += player.get_gravity() * _delta
	player.velocity.x = player.SPEED * input_direction_x
	
	coyote_jump_logic()

	player.animation_player.flip_h = true if input_direction_x < 0 else false if input_direction_x > 0 else player.animation_player.flip_h
	
	if player.velocity.x == 0:
		finished.emit("Idle")
		return

	if Input.is_action_just_pressed("Jump"):
		if player.is_on_floor() or not $CoyoteJump.is_stopped():
			$CoyoteJump.stop()
			finished.emit("Jump")
	
	was_on_floor = player.is_on_floor()

func coyote_jump_logic() -> void:
	if was_on_floor and not player.is_on_floor() and player.velocity.y >= 0:
		$CoyoteJump.start()

func handle_input(_event) -> void:
	if _event.is_action_pressed("Q"):
		finished.emit("Roll")
