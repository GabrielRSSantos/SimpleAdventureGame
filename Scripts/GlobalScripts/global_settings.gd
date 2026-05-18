extends Node

var settings_scene = preload("res://Scenes/Settings.tscn")

enum Language { POR, ENG }

var volume = 50
var language = Language.POR

func apply_new_settings() -> void:
	pass

func instantiate_setting_ui() -> void:
	add_child(settings_scene.instantiate())
