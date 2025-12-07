extends Interactable

@export var npc_name: String = "NPC"
@export var dialogue_id: String = "default"

func _ready() -> void:
	interacted.connect(_on_interacted)

func _on_interacted(_player: Node) -> void:
	# Trigger dialogue when the player interacts with this NPC.
	# The `_player` parameter is intentionally unused, and the underscore
	# suppresses the "unused parameter" warning.
	var dialogue_manager = get_tree().get_first_node_in_group("DialogueManager")
	if dialogue_manager:
		dialogue_manager.start_dialogue(dialogue_id, self)

# Handler for player interactions; forwards to _on_interacted()
func on_player_interact(player: Node) -> void:
	_on_interacted(player)
