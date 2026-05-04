class_name FlyEnemy extends CharacterBody2D

#IMPORTED LOCAL NODES
@onready var enemy_sprite = $EnemySprite
@onready var label_state: Label = $LabelState

@export var enemy_life := 2
@export var distance_to_patrol := 100
@onready var start_position = global_position

const SPEED = 50.0
var direction := 1

func _physics_process(delta: float) -> void:
	move_and_slide()

func _on_enemy_hurt_box_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("Player"):
		$StateMachine._transition_to_next_state("Hurt")
