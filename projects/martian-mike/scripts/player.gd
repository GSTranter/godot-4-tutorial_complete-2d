extends CharacterBody2D


@export var speed = 125.0
@export var jump_force = 400

@onready var animated_sprite = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		if velocity.y > 500:
			velocity.y = 500

	if Input.is_action_just_pressed("jump") && is_on_floor():
		velocity.y = -jump_force

	var direction = Input.get_axis("move_left", "move_right")
	
	velocity.x = direction * speed
	
	if direction != 0:
		animated_sprite.flip_h = direction == -1
	
	move_and_slide()
	
	update_animations(direction)

func update_animations(direction):
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		if velocity.y < 0:
			animated_sprite.play("jump")
		else:
			animated_sprite.play("fall")
