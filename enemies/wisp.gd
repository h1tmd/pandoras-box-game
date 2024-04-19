extends CharacterBody2D

signal collided

const SPEED = 100
var direction: Vector2 = Vector2.RIGHT * SPEED * -1

func _ready():
	set_physics_process(false)

func _physics_process(delta):
	enemy_wall_collision()
	enemy_walk(delta)
	enemy_flip(delta)

	move_and_slide()

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

func start_moving(_body):
	set_physics_process(true)
	
func _on_area_2d_body_entered(body):
	if body.name == "Pandora":
		body.set_physics_process(false)
		set_physics_process(false)
		collided.emit()
