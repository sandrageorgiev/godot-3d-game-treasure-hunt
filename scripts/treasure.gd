extends Area3D

func _ready():
	add_to_group("treasures")

func _on_body_entered(body):
	if body.is_in_group("player"):
		get_node("/root/GameManager").collect_treasure()
		queue_free()
