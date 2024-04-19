extends State

@onready var animation_player = $"../../AnimationPlayer"
@onready var boss = $"../../Boss"

var contact = false
var velocity : Vector2 = Vector2.ZERO
#var current_position : Vector2
var previous_position : float = 0
var defeated := false

func Enter():
	animation_player.play("dash")
	#call_deferred("Transitioned.emit(self, 'idle')")
	Transitioned.emit(self, "idle")

func Exit():
	await animation_player.animation_finished
	#if boss.position < Vector2(0, 0):
		#boss.queue_free()
		#print("freed")


func Update(_delta: float):
	if not defeated:
		if boss.position < Vector2(-290, -255):
			boss.queue_free()
			defeated = true
			print("freed")
	## check if colliding with mushroom
		########stop animation
		## launch boss
		##queue free boss
	#if animation_player.animation_finished:
		#Transitioned.emit(self, "idle")

func Physics_Update(_delta: float):
	#var speed = (boss.position.x - previous_position) / _delta
	#print("Speed: ", speed)
	#previous_position = boss.position.x
	if contact and not defeated:
		#var acceleration = boss.global_position.direction_to(Vector2(0, 0)) * 500
		#velocity += acceleration * _delta
		velocity = boss.position.direction_to(Vector2(-290, -255)) * 3000
		#rotation = velocity.angle()

		boss.position += velocity * _delta


func _on_boss_mushroom_contact():
	contact = true
	animation_player.pause()
