extends Node2D

signal mushroom_contact
signal collided

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var pandora = get_parent().find_child("Pandora")
@onready var player_hurt = $"../PlayerHurt"
@onready var mushroom_jump = $"Mushroom Jump"

var direction : Vector2
@export var projectile_node : PackedScene

func _process(_delta):
	direction = pandora.position - position
	if direction.x > 0:
		animated_sprite_2d.flip_h = true
	else:
		animated_sprite_2d.flip_h = false

func _on_area_2d_body_entered(body):
	if body == pandora:
		player_hit()
	elif body.name == "Mushroom":
		mushroom_contact.emit()
		mushroom_jump.play()

func make_projectile(projectile_direction: Vector2):
	var projectile = projectile_node.instantiate()
	projectile.position = global_position
	projectile.connect("collided", player_hit)
	projectile.set_direction(projectile_direction)
	get_tree().current_scene.call_deferred("add_child", projectile)

func player_hit():
	player_hurt.play()
	pandora.set_physics_process(false)
	set_physics_process(false)
	collided.emit()
