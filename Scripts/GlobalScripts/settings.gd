extends CanvasLayer

func _on_cancel_pressed() -> void:
	get_tree().paused = false
	queue_free()

func _on_confirm_pressed() -> void:
	GlobalSettings.apply_new_settings()
	get_tree().paused = false
	queue_free()
