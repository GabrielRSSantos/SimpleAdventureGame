extends Node

var props: Dictionary = {
	"Items": {"coin" : 0, "red_apple": 0},
	"World": {"current_world": 1},
	"Checkpoint" : Vector2.ZERO,
	"Skills": {}
}

func add_prop(chave: String, valor) -> void:
	props[chave] = valor

func has_prop(chave: String) -> bool:
	return props.has(chave)

func get_key_value(chave: String):
	if props.has(chave):
		return props[chave]
	return null

func has_key_in_pros(objeto: PlayerManager, chave: String) -> bool:
	if objeto != null:
		return objeto.has_prop(chave)
	return false
