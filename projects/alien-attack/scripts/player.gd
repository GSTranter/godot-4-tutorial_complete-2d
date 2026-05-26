extends CharacterBody2D

signal took_damage

var speed = 300

var rocket_scene = preload("res://scenes/rocket.tscn")

@onready var rocket_container = $RocketContainer

func _physics_process(delta):
	velocity.x = _get_x_vel()
	velocity.y = _get_y_vel()
	move_and_slide()
	check_shoot()
	
	global_position = global_position.clamp(Vector2(0, 0), get_viewport_rect().size)


func _get_x_vel():
	if Input.is_action_pressed("move_left"): return -speed
	if Input.is_action_pressed("move_right"): return speed
	return 0
	
func _get_y_vel():
	if Input.is_action_pressed("move_up"): return -speed
	if Input.is_action_pressed("move_down"): return speed
	return 0

func check_shoot():
	if Input.is_action_just_pressed("shoot"):
		var rocket_inst = rocket_scene.instantiate()
		rocket_inst.global_position = global_position
		rocket_inst.global_position.x += 80
		
		rocket_container.add_child(rocket_inst)

func take_damage():
	emit_signal("took_damage")
	
func die():
	queue_free()
