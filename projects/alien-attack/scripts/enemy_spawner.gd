extends Node2D

var enemy_scene = preload("res://scenes/enemy.tscn")

@onready var spawn_positions = $SpawnPositions.get_children()

func _on_timer_timeout() -> void:
	spawn_enemy()

func spawn_enemy():	
	var enemy_inst = enemy_scene.instantiate()
	enemy_inst.global_position = spawn_positions.pick_random().global_position
	add_child(enemy_inst)
