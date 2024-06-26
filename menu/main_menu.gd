extends Node2D

var credits = preload("res://menu/credits_screen.tscn")

func _ready():
	if not MusicPlayer.playing:
		MusicPlayer.stream = load("res://assets/audio/music/Fly - Title Screen.mp3")
		MusicPlayer.play()

# start button
func _on_start_button_pressed(): 
	SceneChanger.change_scene("res://levels/level_1.tscn")
	MusicPlayer.stop()
func _on_start_button_mouse_entered(): 
	$buttons/start/start_sprite.scale = Vector2(0.35, 0.35)
	$animation/L_anim_start.play("forwards")
	$animation/R_anim_start.play("forwards")
func _on_start_button_mouse_exited(): 
	$buttons/start/start_sprite.scale = Vector2(0.3, 0.3)
	$animation/L_anim_start.play("reverse")
	$animation/R_anim_start.play("reverse")

# credits button
func _on_credits_button_pressed(): SceneChanger.change_scene("res://menu/credits_screen.tscn")
func _on_credits_button_mouse_entered():
	$buttons/credits/credits_sprite.scale = Vector2(0.35, 0.35)
	$animation/L_anim_credits.play("forwards")
	$animation/R_anim_credits.play("forwards")
func _on_credits_button_mouse_exited():
	$buttons/credits/credits_sprite.scale = Vector2(0.3, 0.3)
	$animation/L_anim_credits.play("reverse")
	$animation/R_anim_credits.play("reverse")

# quit button
func _on_quit_button_pressed(): get_tree().quit()
func _on_quit_button_mouse_entered():
	$buttons/quit/quit_sprite.scale = Vector2(0.35, 0.35)
	$animation/L_anim_quit.play("forwards")
	$animation/R_anim_quit.play("forwards")
func _on_quit_button_mouse_exited():
	$buttons/quit/quit_sprite.scale = Vector2(0.3, 0.3)
	$animation/L_anim_quit.play("reverse")
	$animation/R_anim_quit.play("reverse")

# as the program runs
func _process(delta):
	# background movement
	$background.position.x += 20 * delta
	if $background.position.x > 1129.5:
		$background.position.x = 0
