extends EnemyState

func enter(previous_state_path: String, data := {}) -> void:
	print("PATROL")
	enemy.label_state.text = "PATROL"
	enemy.enemy_sprite.play("Walk")

func physics_update(_delta: float) -> void:
	enemy.velocity.x = enemy.SPEED * enemy.direction
	enemy_patrol()
	enemy.move_and_slide()

func enemy_patrol() -> void:
	var limit_right = enemy.start_position.x + enemy.distance_to_patrol
	var limit_left = enemy.start_position.x - enemy.distance_to_patrol
	
	if !enemy.enemy_raycast.is_colliding():
		enemy.direction *= -1
		enemy.enemy_sprite.flip_h = !enemy.enemy_sprite.flip_h
		enemy.enemy_raycast.position.x *= -1

	if enemy.global_position.x >= limit_right:
		enemy.direction = -1
		enemy.enemy_raycast.position.x = -8
		enemy.enemy_sprite.flip_h = true
	elif enemy.global_position.x <= limit_left:
		enemy.direction = 1
		enemy.enemy_raycast.position.x = 8
		enemy.enemy_sprite.flip_h = false
