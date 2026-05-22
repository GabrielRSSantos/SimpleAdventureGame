extends Node2D

func _ready() -> void:
	PlayerManager.props["World"]["current_world"] = 3

func _on_next_world_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		var show_world_map = GlobalSettings.world_map.instantiate()
		show_world_map.current_world = 1
		get_tree().root.add_child(show_world_map)
		queue_free()
