extends EnemyState

func enter(previous_state_path: String, data := {}) -> void:
	print("IDLE")
	enemy.label_state.text = "IDLE"
	
	if enemy.distance_to_patrol != 0:
		finished.emit("Patrol")
		return
		
	enemy.enemy_sprite.play("Idle")

func physics_update(_delta: float) -> void:
	enemy.move_and_slide()
