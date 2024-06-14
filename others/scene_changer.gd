extends CanvasLayer

signal scene_changed

@onready var animation_player = $AnimationPlayer
@onready var black = $Control/ColorRect
@onready var scene_change_audio = $SceneChangeAudio

func change_scene(path):
	await get_tree().create_timer(0.5).timeout
	animation_player.play("fade")
	scene_change_audio.play()
	await animation_player.animation_finished
	get_tree().change_scene_to_file(path)
	animation_player.play_backwards("fade")
	scene_changed.emit()
