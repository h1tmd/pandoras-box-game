extends CharacterBody2D

const SPEED = 600.0
const JUMP_VELOCITY = -1000.0

@onready var animated_sprite_2d = $AnimatedSprite2D

var paused := false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_casting := false


func unpause(_res):
	paused = false


func _ready():
	DialogueManager.dialogue_ended.connect(unpause)


func _physics_process(delta):
	# Animations
	if is_casting:
		animated_sprite_2d.play("spellcast")
	elif abs(velocity.x) > 0.1:
		animated_sprite_2d.play("walk")
	else:
		animated_sprite_2d.play("idle")
	if velocity.x < 0:
		animated_sprite_2d.flip_h = true
	elif velocity.x > 0:
		animated_sprite_2d.flip_h = false
	
	# Gravity
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# Horizontal Movement
	var direction = Input.get_axis("move_left", "move_right")
	if direction and not paused:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 30)
	move_and_slide()


func _unhandled_input(_event):
	# Jump
	if Input.is_action_just_pressed("jump") and is_on_floor() and not paused:
		velocity.y = JUMP_VELOCITY


func prompt_dialogue(title):
	var dialogue_file = load("res://dialogue/maindialogue.dialogue")
	paused = true
	DialogueManager.show_dialogue_balloon(dialogue_file, title)


func cast_spell():
	is_casting = true


func _on_animated_sprite_2d_animation_finished():
	is_casting = false
