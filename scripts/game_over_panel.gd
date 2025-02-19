extends Control

func _ready():
	hide()

func show_message(text):
	$Message.text = text
	show()

func _on_retry_button_pressed():
	get_tree().reload_current_scene()
