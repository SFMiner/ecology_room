extends CharacterBody2D

@export var speed: float = 200.0
@export var interact_distance: float = 64.0
@export var interact_key: StringName = "ui_accept"

var _facing_dir: Vector2 = Vector2.RIGHT

func _physics_process(delta: float) -> void:
	var input_dir = Vector2.ZERO
	input_dir.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_dir.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")

	if input_dir.length() > 0:
		input_dir = input_dir.normalized()
		_facing_dir = input_dir

	velocity = input_dir * speed
	move_and_slide()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed(interact_key):
		_try_interact()

func _try_interact() -> void:
	var space_state = get_world_2d().direct_space_state
	var result = space_state.intersect_ray(
		PhysicsRayQueryParameters2D.create(global_position, global_position + _facing_dir * interact_distance)
	)

	if result and result.collider and result.collider.has_method("on_player_interact"):
		result.collider.on_player_interact(self)
