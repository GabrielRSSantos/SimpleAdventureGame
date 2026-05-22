extends Control

func _on_start_game_pressed() -> void:
	var start_game = preload("res://Scenes/WorldMap.tscn").instantiate()
	start_game.current_world = 1
	get_tree().root.add_child(start_game)
	queue_free()

func _on_setting_pressed() -> void:
	GlobalSettings.instantiate_setting_ui()


func _on_quit_pressed() -> void:
	get_tree().quit()
