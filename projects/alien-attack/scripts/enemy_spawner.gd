extends Node2D

signal enemy_spawned(enemy_instance)
signal path_enemy_spawned(inst)

var enemy_scene = preload("res://scenes/enemy.tscn")
var path_enemy_scene = preload("res://scenes/path_enemy.tscn")

@onready var spawn_positions = $SpawnPositions.get_children()

func _on_timer_timeout() -> void:
	spawn_enemy()

func spawn_enemy():	
	var enemy_inst = enemy_scene.instantiate()
	enemy_inst.global_position = spawn_positions.pick_random().global_position
	emit_signal("enemy_spawned", enemy_inst)


func _on_path_timer_timeout() -> void:
	var path_enemy_inst = path_enemy_scene.instantiate()
	emit_signal("path_enemy_spawned", path_enemy_inst)
