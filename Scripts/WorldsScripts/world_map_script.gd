extends Control

var new_world1 = preload("res://Scenes/Worlds/World01.tscn")
var new_world2 = preload("res://Scenes/Worlds/World02.tscn")
var new_world3 = preload("res://Scenes/Worlds/World03.tscn")

var worlds = {
	"world01": {"World": "World 1", "Title": "Green Island"},
	"world02": {"World": "World 2", "Title": "Lost Desert"},
	"world03": {"World": "World 3", "Title": "Ice Storming"}
}

var current_world = 1
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var can_press_button := false

func _ready() -> void:
	match current_world:
		1:
			update_gui_world(worlds["world01"]["World"], worlds["world01"]["Title"], "World01")
		2:
			update_gui_world(worlds["world02"]["World"], worlds["world02"]["Title"], "World02")
		3:
			update_gui_world(worlds["world03"]["World"], worlds["world03"]["Title"], "World03")

func _process(_delta: float) -> void:
	if can_press_button:
		$Label3.visible = true
		
		if Input.is_action_just_pressed("E"):
			go_to_next_map(current_world)

func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	can_press_button = true

func update_gui_world(world_num: String, world_name: String, anim_name: String) -> void:
	$TitleBox/Label.text = world_num
	$TitleBox/Label2.text = world_name
	animation_player.play(anim_name)

func go_to_next_map(map_number: int) -> void:
	var new_world = null
	match map_number:
		1:
			new_world = new_world1.instantiate()
		2:
			new_world = new_world2.instantiate()
		3:
			new_world = new_world3.instantiate()
			
	get_tree().root.add_child(new_world)
	queue_free()
