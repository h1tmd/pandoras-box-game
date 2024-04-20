extends Node2D

func _process(delta):
	if $roll_credits.position.y <= -1275:
		get_tree().change_scene_to_file("res://Levels/main_menu.tscn")
	else:
		$roll_credits.position.y -= 40 * delta
