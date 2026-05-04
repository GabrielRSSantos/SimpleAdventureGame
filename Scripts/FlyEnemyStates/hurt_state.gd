extends FlyEnemyState

func enter(previous_state_path: String, _data := {}) -> void:
	printerr("HURT LIFE: " + str(fly_enemy.enemy_life))
	fly_enemy.label_state.text = "HURT"
	fly_enemy.enemy_life -= 1
	if fly_enemy.enemy_life == 0:
		finished.emit("Dead")
		return
		
	fly_enemy.velocity.x = 0
	fly_enemy.enemy_sprite.play("Hurt")
	await fly_enemy.enemy_sprite.animation_finished
	finished.emit(previous_state_path)

func physics_update(_delta: float) -> void:
	fly_enemy.move_and_slide()
