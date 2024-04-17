extends AnimatedSprite2D

var player_in = false
var interacted = false

signal dialogue(title)

func _on_area_2d_body_entered(body):
	if body.name == "Pandora":
		player_in = true
		material.set_shader_parameter("line_color", Color.WHITE)


func _on_area_2d_body_exited(body):
	if body.name == "Pandora":
		player_in = false
		material.set_shader_parameter("line_color", Color.TRANSPARENT)


func _unhandled_input(_event):
	if Input.is_action_just_pressed("interact") and player_in:
		if not interacted:
			dialogue.emit("rand1")
			interacted = true
		else:
			dialogue.emit("rand2")
