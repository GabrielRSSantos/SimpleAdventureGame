class_name Player extends CharacterBody2D

var SPEED = 100.0
var JUMP_VELOCITY = -300.0
var gravity = 800

@onready var label_state = $LabelState
@onready var animation_player = $PlayerSprite

func _on_player_hurt_box_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemy"):
		$StateMachine._transition_to_next_state("Hurt")

func _on_player_hit_box_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemy"):
		$StateMachine._transition_to_next_state("Jump")
