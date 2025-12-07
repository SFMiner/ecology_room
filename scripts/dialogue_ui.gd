extends Control

@onready var label: Label  = $Panel/Label
@onready var button: Button = $Panel/Button

var _queue: Array[String] = []
var _current_speaker: Node = null

var dialogues := {
	"raven_intro": [
		"Raven: No wolves in this valley anymore. The elk strut like they own the place.",
        "Raven: Watch what happens if you bring the wolves back… and then go talk to everyone."
	],
	"elk_intro": [
		"Elk: Easy grazing these days. No predators, just grass and willows.",
        "Elk: I can eat wherever I want. Nothing chases me down to the river anymore."
	],
	"willow_intro": [
		"Willow Spirit: My roots are tired. The elk chew my shoots as soon as they rise.",
        "Willow Spirit: We used to have more cover, more songbirds, more life. Something is missing."
	],
	"elk_after_wolves": [
		"Elk: Ever since the wolves showed up, I have to stay on the move.",
        "Elk: I can't just stand by the river and chew all day anymore."
	],
	"willow_after_wolves": [
		"Willow Spirit: The wolves are back. The elk don't linger here for hours now.",
        "Willow Spirit: My branches are slowly recovering. More birds will come soon."
	]
}

func _ready() -> void:
	add_to_group("DialogueManager")
	hide()
	button.pressed.connect(_on_next_pressed)

func start_dialogue(id: String, speaker: Node = null) -> void:
	_current_speaker = speaker
	_queue = dialogues.get(id, ["... (no dialogue found)"]).duplicate()
	_show_next()

func show_system_message(text: String) -> void:
	_current_speaker = null
	_queue = [text]
	_show_next()

func _show_next() -> void:
	if _queue.is_empty():
		hide()
		return

	label.text = _queue.pop_front()
	show()

func _on_next_pressed() -> void:
	_show_next()
