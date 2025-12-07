extends Area2D
class_name Interactable

signal interacted(player)

@export var prompt_text: String = "Press [E]"

func on_player_interact(player: Node) -> void:
    emit_signal("interacted", player)
