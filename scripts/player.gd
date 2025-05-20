extends CharacterBody2D

@export var speed: float = 250.0

# Ensure WASD actions are present in the InputMap at runtime so the user does not
# need to set them manually in the project settings.
func _ready() -> void:
	_ensure_input_actions()
	_add_placeholder_sprite()

func _physics_process(delta: float) -> void:
	var direction := Vector2.ZERO
	if Input.is_action_pressed("move_left"):
		direction.x -= 1.0
	if Input.is_action_pressed("move_right"):
		direction.x += 1.0
	if Input.is_action_pressed("move_up"):
		direction.y -= 1.0
	if Input.is_action_pressed("move_down"):
		direction.y += 1.0

	if direction != Vector2.ZERO:
		direction = direction.normalized()

	velocity = direction * speed
	move_and_slide()

func _ensure_input_actions():
	var mapping: Dictionary = {
		"move_up": 87,    # W
		"move_down": 83,  # S
		"move_left": 65,  # A
		"move_right": 68  # D
	}

	for action_name in mapping.keys():
		if not InputMap.has_action(action_name):
			InputMap.add_action(action_name)
		# Only add event if not already present to avoid duplicates during hot reloads.
		var already_present := false
		for existing_event in InputMap.action_get_events(action_name):
			if existing_event is InputEventKey and existing_event.keycode == mapping[action_name]:
				already_present = true
				break
		if already_present:
			continue
		var ev := InputEventKey.new()
		ev.keycode = mapping[action_name]
		InputMap.action_add_event(action_name, ev)

func _add_placeholder_sprite():
	# If the node already has a visual child, do nothing.
	if get_child_count() > 0:
		return
	var sprite := Sprite2D.new()
	sprite.texture = preload("res://assets/PNG/cat_animation.png")
	sprite.region_enabled = false
	sprite.centered = true
	add_child(sprite) 
