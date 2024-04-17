extends Node2D

signal jumped

func _on_area_2d_body_entered(body):
	if body.name == "Pandora":
		body.velocity.y = -1550
		await get_tree().create_timer(0.3).timeout
		jumped.emit()
		free()
