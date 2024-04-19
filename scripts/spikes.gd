extends State

@export var spikes_scene : PackedScene
@export var warning_scene : PackedScene
var spikes : Node

func Enter():
	var warning = warning_scene.instantiate()
	get_tree().current_scene.call_deferred("add_child", warning)
	await get_tree().create_timer(1.5).timeout
	warning.queue_free()
	
	spikes = spikes_scene.instantiate()
	get_tree().current_scene.call_deferred("add_child", spikes)
	await get_tree().create_timer(0.3).timeout
	spikes.queue_free()
	print("before")
	Transitioned.emit(self, "dash")
	print("after")


