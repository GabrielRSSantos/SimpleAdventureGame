extends EnemyState

func enter(previous_state_path: String, data := {}) -> void:
	print("WALK")
	enemy.label_state.text = "WALK"
	enemy.enemy_sprite.play("Walk")

func physics_update(_delta: float) -> void:
	enemy.velocity.x = enemy.SPEED * enemy.direction
	enemy.move_and_slide()
