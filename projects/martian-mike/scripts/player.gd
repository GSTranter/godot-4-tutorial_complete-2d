extends CharacterBody2D


@export var speed = 125.0
@export var jump_force = 400


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		if velocity.y > 500:
			velocity.y = 500

	if Input.is_action_just_pressed("jump"):
		velocity.y = -jump_force

	var direction = Input.get_axis("move_left", "move_right")
	velocity.x = direction * speed
	move_and_slide()
