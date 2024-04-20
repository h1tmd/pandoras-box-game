extends Sprite2D

@onready var pandora = $"../Pandora"

func _on_area_2d_body_entered(body):
	if body == pandora:
		pandora.paused = true
		SceneChanger.change_scene("res://levels/level_2.tscn")
		MusicPlayer.stop()
