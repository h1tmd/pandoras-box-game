extends State

signal collided

@export var spikes_scene : PackedScene
@export var warning_scene : PackedScene

@onready var spikes_audio = $"../../Spikes Audio"
@onready var player_hurt = $"../../PlayerHurt"
@onready var pandora = $"../../Pandora"

var spikes : Node

func Enter():
	var warning = warning_scene.instantiate()
	get_tree().current_scene.call_deferred("add_child", warning)
	await get_tree().create_timer(1.5).timeout
	warning.queue_free()
	
	spikes_audio.play()
	spikes = spikes_scene.instantiate()
	get_tree().current_scene.call_deferred("add_child", spikes)
	spikes.connect("body_entered", touched_spikes)
	await get_tree().create_timer(0.3).timeout
	spikes.queue_free()
	Transitioned.emit(self, "dash")

func touched_spikes(body):
	if body == pandora:
		player_hurt.play()
		pandora.set_physics_process(false)
		collided.emit()
