extends AnimatedSprite2D

var player_in = false
var interacted = false

signal dialogue(title)

func _on_area_2d_body_entered(body):
	if body.name == "Pandora":
		dialogue.emit("boss")
		await DialogueManager.dialogue_ended
		SceneChanger.change_scene("res://levels/level_3.tscn")
		MusicPlayer.stop()
