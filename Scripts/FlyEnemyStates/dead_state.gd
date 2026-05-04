extends FlyEnemyState

func enter(previous_state_path: String, data := {}) -> void:
	print("DEAD")
	fly_enemy.label_state.text = "DEAD"
	fly_enemy.velocity.x = 0
	$"../../EnemyHurtBoxArea".set_deferred("monitorable", false)
	$"../../EnemyHurtBoxArea".set_deferred("monitoring", false)
	$"../../EnemyHitBoxArea".set_deferred("monitorable", false)
	$"../../EnemyHitBoxArea".set_deferred("monitoring", false)
	fly_enemy.enemy_sprite.play("Hurt")
	await fly_enemy.enemy_sprite.animation_finished
	fly_enemy.queue_free()
