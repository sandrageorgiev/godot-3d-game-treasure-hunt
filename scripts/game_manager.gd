extends Node

var score = 0
var total_treasures = 0
var time_remaining = 180  # 3 minutes
@onready var timer_label = $UI/TimerLabel
@onready var score_label = $UI/ScoreLabel

func _ready():
	count_treasures()
	$Timer.start()

func _process(_delta):
	update_ui()

func count_treasures():
	total_treasures = get_tree().get_nodes_in_group("treasures").size()

func update_ui():
	timer_label.text = "Time: %d" % time_remaining
	score_label.text = "Score: %d/%d" % [score, total_treasures]

func _on_timer_timeout():
	time_remaining -= 1
	if time_remaining <= 0:
		end_game(false)

func collect_treasure():
	score += 1
	if score >= total_treasures:
		end_game(true)

func end_game(won):
	$Timer.stop()
	var message = "You Win!" if won else "Try Again!"
	$UI/GameOverPanel.show_message(message)
