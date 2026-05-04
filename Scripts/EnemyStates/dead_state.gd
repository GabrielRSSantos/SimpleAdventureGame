extends EnemyState

func enter(previous_state_path: String, data := {}) -> void:
	print("DEAD")
	enemy.label_state.text = "DEAD"
	enemy.velocity.x = 0
	$"../../EnemyHurtBoxArea".set_deferred("monitorable", false)
	$"../../EnemyHurtBoxArea".set_deferred("monitoring", false)
	$"../../EnemyHitBoxArea".set_deferred("monitorable", false)
	$"../../EnemyHitBoxArea".set_deferred("monitoring", false)
	enemy.enemy_sprite.play("Hurt")
	await enemy.enemy_sprite.animation_finished
	enemy.queue_free()

func physics_update(_delta: float) -> void:
	enemy.move_and_slide()
