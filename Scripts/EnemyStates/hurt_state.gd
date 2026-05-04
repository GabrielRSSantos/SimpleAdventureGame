extends EnemyState

func enter(previous_state_path: String, _data := {}) -> void:
	printerr("HURT LIFE: " + str(enemy.enemy_life))
	enemy.label_state.text = "HURT"
	enemy.enemy_life -= 1
	if enemy.enemy_life == 0:
		finished.emit("Dead")
		return
		
	enemy.velocity.x = 0
	enemy.enemy_sprite.play("Hurt")
	await enemy.enemy_sprite.animation_finished
	finished.emit(previous_state_path)

func physics_update(_delta: float) -> void:
	enemy.move_and_slide()
