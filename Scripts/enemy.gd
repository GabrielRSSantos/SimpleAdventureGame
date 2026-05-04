extends CharacterBody2D

@export var enemy_life := 2
@export var distance_to_patrol := 100

const SPEED = 100.0
const JUMP_VELOCITY = -400.0

@onready var start_position = global_position
var direction := 1

func _physics_process(delta: float) -> void:
	enemy_patrol()
	velocity.x = SPEED * direction
	if not is_on_floor():
		velocity += get_gravity() * delta
	move_and_slide()

func _on_enemy_hurt_box_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("Player"):
		enemy_life -= 1
		$EnemySprite.play("Hurt")
		await $EnemySprite.animation_finished
		if enemy_life == 0:
			self.queue_free()
		$EnemySprite.play("Idle")

func enemy_patrol() -> void:
	var limit_right = start_position.x + distance_to_patrol
	var limit_left = start_position.x - distance_to_patrol
	
	if !$RayCast2D.is_colliding():
		direction *= -1
		$EnemySprite.flip_h = !$EnemySprite.flip_h
		$RayCast2D.position.x *= -1

	if global_position.x >= limit_right:
		direction = -1
		$RayCast2D.position.x = -8
		$EnemySprite.flip_h = true
	elif global_position.x <= limit_left:
		direction = 1
		$RayCast2D.position.x = 8
		$EnemySprite.flip_h = false
