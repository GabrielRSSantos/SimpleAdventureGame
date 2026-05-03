extends CharacterBody2D

@export var enemy_life := 2

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _process(_delta: float) -> void:
	if enemy_life == 0:
		self.queue_free()

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	move_and_slide()

#func _on_hit_box_area_body_entered(body: Node2D) -> void:
	#if body.is_in_group("Player"):
		#$EnemySprite.play("Hurt")
		#enemy_life -= 1
