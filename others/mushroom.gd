extends Node2D

signal jumped

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var collision_shape_2d = $CollisionShape2D
var state = true
const ENEMIES = ["Slime", "Goblin"]

func _on_area_2d_body_entered(body):
	if state:
		if body.name in ENEMIES:
			body.velocity.y = -1800
			state = false
			collision_shape_2d.set_deferred("disabled", true)
			animated_sprite_2d.play("disappear")
			await animated_sprite_2d.animation_finished
			jumped.emit()
			queue_free()
		elif body.name == "Pandora":
			body.velocity.y = -1550
			state = false
			collision_shape_2d.set_deferred("disabled", true)
			animated_sprite_2d.play("disappear")
			await animated_sprite_2d.animation_finished
			jumped.emit()
			queue_free()
