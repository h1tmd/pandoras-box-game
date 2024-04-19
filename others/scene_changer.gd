extends CanvasLayer

signal scene_changed

@onready var animation_player = $AnimationPlayer
@onready var black = $Control/ColorRect

func change_scene(path):
	await get_tree().create_timer(0.5).timeout
	animation_player.play("fade")
	await animation_player.animation_finished
	assert(get_tree().change_scene_to_file(path) == OK)
	animation_player.play_backwards("fade")
	scene_changed.emit()
