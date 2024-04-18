extends State

@onready var animation_player = $"../../AnimationPlayer"

func Enter():
	await animation_player.animation_finished
	animation_player.play("idle")
	await get_tree().create_timer(3).timeout
	
	animation_player.play("projectiles")
	await animation_player.animation_finished
	
	Transitioned.emit(self, "spikes")
