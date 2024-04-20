extends Node2D

func _process(delta):
	if $roll_credits.position.y <= -1275:
		SceneChanger.change_scene("res://menu/main_menu.tscn")
	else:
		$roll_credits.position.y -= 40 * delta
