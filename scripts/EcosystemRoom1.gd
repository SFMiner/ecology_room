extends Node2D

func _ready() -> void:
	if StoryState.get_var("wolf_pop") == null:
		StoryState.set_var("wolf_pop", 0)
		StoryState.set_var("elk_pop", 12)
		StoryState.set_var("willow_health", 3)
