extends PlayerState

func enter(previous_state_path: String, data := {}) -> void:
	$JumpAudio.play()
	player.label_state.text = "JUMP"
	print("JUMP")
	player.velocity.y = player.JUMP_VELOCITY
	
func physics_update(_delta: float) -> void:
	$"../../PlayerAnimation".play("JumpAnimation")
	var input_direction_x := Input.get_axis("A", "D")
	player.move_and_slide()
	player.velocity += player.get_gravity() * _delta
	player.velocity.x = player.SPEED * input_direction_x
	
	if player.velocity.y >= 0 or Input.is_action_just_released("Jump"):
		finished.emit("Fall")

	player.animation_player.flip_h = input_direction_x < 0 if input_direction_x != 0 else player.animation_player.flip_h

func exit() -> void:
	player.velocity.y = 0
