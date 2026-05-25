extends CharacterBody2D

var speed = 300

func _physics_process(delta):
	velocity.x = _get_x_vel()
	velocity.y = _get_y_vel()
	move_and_slide()
	
	global_position = global_position.clamp(Vector2(0, 0), get_viewport_rect().size)


func _get_x_vel():
	if Input.is_action_pressed("move_left"): return -speed
	if Input.is_action_pressed("move_right"): return speed
	return 0
	
func _get_y_vel():
	if Input.is_action_pressed("move_up"): return -speed
	if Input.is_action_pressed("move_down"): return speed
	return 0
