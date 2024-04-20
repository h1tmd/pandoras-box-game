extends State

signal end(title)

@onready var animation_player = $"../../AnimationPlayer"
@onready var boss = $"../../Boss"

var contact = false
var velocity : Vector2 = Vector2.ZERO
#var current_position : Vector2
var previous_position : float = 0
var defeated := false

func Enter():
	animation_player.play("dash")
	await animation_player.animation_finished
	#call_deferred("Transitioned.emit(self, 'idle')")
	Transitioned.emit(self, "idle")

func Exit():
	pass
	#await animation_player.animation_finished
	#if boss.position < Vector2(0, 0):
		#boss.queue_free()
		#print("freed")


func Update(_delta: float):
	if not defeated:
		# Boss defeated
		if boss.position < Vector2(-290, -255):
			boss.queue_free()
			defeated = true
			await get_tree().create_timer(2).timeout
			MusicPlayer.stop()
			MusicPlayer.stream = load("res://assets/audio/music/Fly - Title Screen.mp3")
			MusicPlayer.play()
			end.emit("endcredit")
			#SceneChanger.change_scene("res://levels/level_1.tscn")

func Physics_Update(_delta: float):
	if contact and not defeated:
		velocity = boss.position.direction_to(Vector2(-290, -255)) * 3000
		boss.position += velocity * _delta

func _on_boss_mushroom_contact():
	contact = true
	animation_player.pause()
