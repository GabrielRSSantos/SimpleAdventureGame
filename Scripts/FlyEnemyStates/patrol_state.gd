extends FlyEnemyState

func enter(previous_state_path: String, data := {}) -> void:
	print("PATROL")
	fly_enemy.label_state.text = "PATROL"
	fly_enemy.enemy_sprite.play("Idle")

func physics_update(_delta: float) -> void:
	fly_enemy.velocity.x = fly_enemy.SPEED * fly_enemy.direction
	fly_enemy_patrol()
	fly_enemy.move_and_slide()

func fly_enemy_patrol() -> void:
	var limit_right = fly_enemy.start_position.x + fly_enemy.distance_to_patrol
	var limit_left = fly_enemy.start_position.x - fly_enemy.distance_to_patrol

	if fly_enemy.global_position.x >= limit_right:
		fly_enemy.direction = -1
		fly_enemy.enemy_sprite.flip_h = false
	elif fly_enemy.global_position.x <= limit_left:
		fly_enemy.direction = 1
		fly_enemy.enemy_sprite.flip_h = true
