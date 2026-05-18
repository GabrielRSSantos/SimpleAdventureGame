extends Control

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_start_game_pressed() -> void:
	pass


func _on_setting_pressed() -> void:
	GlobalSettings.instantiate_setting_ui()


func _on_quit_pressed() -> void:
	get_tree().quit()
