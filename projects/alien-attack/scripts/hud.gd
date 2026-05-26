extends Control

@onready var lives_left_label = $LivesLeft
@onready var score = $Score

func set_score_label(new_score):
	score.text = "Score: " + str(new_score)

func set_lives_label(num_lives):
	lives_left_label.text = str(num_lives)
