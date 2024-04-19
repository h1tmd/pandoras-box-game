extends State

@onready var animation_player = $"../../AnimationPlayer"
var entrance = true

func Enter():
	if entrance:
		await animation_player.animation_finished
		entrance = false
	animation_player.play("idle")
	await animation_player.animation_finished
	#await get_tree().create_timer(3).timeout
	
	animation_player.play("projectiles")
	await animation_player.animation_finished
	Transitioned.emit(self, "spikes")
