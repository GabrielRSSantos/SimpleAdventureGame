extends PlayerState

var dash_direction := 1.0

func enter(previous_state_path: String, data := {}) -> void:
	player.label_state.text = "ROLL"
	player.animation_player.play("Roll")
	
	dash_direction = 1.0 if player.animation_player.flip_h == false else -1.0
	
	player.velocity.x = (player.SPEED * 3) * dash_direction

func physics_update(_delta: float) -> void:
	player.velocity += player.get_gravity() * _delta
	player.velocity.x = (player.SPEED * 2) * dash_direction
	player.move_and_slide()

func _on_player_sprite_animation_finished() -> void:
	finished.emit("Idle")

func exit() -> void:
	player.velocity = Vector2.ZERO
