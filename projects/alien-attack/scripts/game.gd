extends Node2D

var lives = 3
@onready var player = $Player

func _on_deathzone_area_entered(area: Area2D) -> void:
	area.die()

func _on_player_took_damage() -> void:
	lives -= 1
	if lives <= 0:
		player.die()
