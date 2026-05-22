extends Node

var settings_scene = preload("res://Scenes/Settings.tscn")
var world_map = preload("res://Scenes/WorldMap.tscn")
var world01 = preload("res://Scripts/WorldsScripts/world01.gd")
var world02 = preload("res://Scripts/WorldsScripts/world01.gd")
var world03 = preload("res://Scripts/WorldsScripts/world01.gd")

enum Language { POR, ENG }

var volume = 50
var language = Language.POR

func apply_new_settings() -> void:
	pass

func instantiate_setting_ui() -> void:
	add_child(settings_scene.instantiate())
