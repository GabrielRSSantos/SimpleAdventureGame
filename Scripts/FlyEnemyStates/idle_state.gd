extends FlyEnemyState

func enter(previous_state_path: String, data := {}) -> void:
	print("IDLE")
	fly_enemy.label_state.text = "IDLE"
	
	if fly_enemy.distance_to_patrol != 0:
		finished.emit("Patrol")
		return
		
	fly_enemy.enemy_sprite.play("Idle")

func physics_update(_delta: float) -> void:
	fly_enemy.move_and_slide()
