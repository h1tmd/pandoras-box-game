extends CharacterBody2D

signal collided

@onready var player_hurt = $"../PlayerHurt"

const SPEED = 60
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var direction: Vector2 = Vector2.RIGHT * SPEED

func _physics_process(delta):
	enemy_gravity(delta)
	enemy_wall_collision()
	enemy_walk(delta)
	enemy_flip(delta)

	move_and_slide()

func enemy_gravity(delta):
	velocity.y += gravity * delta

func enemy_walk(delta):
	velocity.x = direction.x * SPEED * delta

func enemy_wall_collision():
	if is_on_wall():
		direction.x *= -1

func enemy_hit_edge():
	if !is_on_floor():
		direction.x *= -1

func enemy_flip(delta):
	if direction.x > 0:
		get_node("AnimatedSprite2D").flip_h = false
	else:
		get_node("AnimatedSprite2D").flip_h = true
		velocity.x = direction.x * SPEED * delta

func _on_area_2d_body_entered(body):
	if body.name == "Pandora":
		player_hurt.play()
		body.set_physics_process(false)
		set_physics_process(false)
		collided.emit()
