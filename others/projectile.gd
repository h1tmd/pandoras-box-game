extends Node2D

var direction : Vector2
var velocity : Vector2 = Vector2.ZERO
var acceleration : Vector2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if direction:
		acceleration = position.direction_to(direction) * 500
		velocity += acceleration * delta
		rotation = velocity.angle()
		
		position += velocity * delta
func set_direction(dir : Vector2):
	direction = dir
	print(direction)


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
