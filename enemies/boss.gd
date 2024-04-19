extends Node2D

signal mushroom_contact 

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var pandora = get_parent().find_child("Pandora")

var direction : Vector2
@export var projectile_node : PackedScene

func _process(delta):
	direction = pandora.position - position
	if direction.x > 0:
		animated_sprite_2d.flip_h = true
	else:
		animated_sprite_2d.flip_h = false

func _on_area_2d_body_entered(body):
	if body == pandora:
		print("hit pandora")
	elif body.name == "Mushroom":
		mushroom_contact.emit()

func make_projectile(projectile_direction: Vector2):
	var projectile = projectile_node.instantiate()
	projectile.position = global_position
	projectile.set_direction(projectile_direction)
	get_tree().current_scene.call_deferred("add_child", projectile)
