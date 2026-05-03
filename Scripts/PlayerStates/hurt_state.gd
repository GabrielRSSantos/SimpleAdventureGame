extends PlayerState

@export var knockback_horizontal: float = 50.0
@export var knockback_vertical: float = -100.0

func enter(previous_state_path: String, data := {}) -> void:
	$HurtAudio.play()
	$"../../PlayerCamera".apply_shake(2)
	player.label_state.text = "HURT"
	print("HURT")
	var face_direction: float = -1.0 if player.animation_player.flip_h else 1.0

	player.velocity.x = -face_direction * knockback_horizontal
	player.velocity.y = knockback_vertical
	
	player.animation_player.play("Hurt")
	await player.animation_player.animation_finished
	
	player.velocity.x = 0
	finished.emit("Idle")

func physics_update(_delta: float) -> void:
	if not player.is_on_floor():
		player.velocity += player.get_gravity() * _delta
	
	player.move_and_slide()
