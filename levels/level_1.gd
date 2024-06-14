extends Node2D

@onready var pause_menu = $"Camera2D/CanvasLayer/Pause Menu"

func _ready():
	if not MusicPlayer.playing:
		MusicPlayer.stream = load("res://assets/audio/music/Dainty Forest - Forest.mp3")
		MusicPlayer.play()


func pause_toggle():
	var new_pause_scene = not get_tree().paused
	get_tree().paused = new_pause_scene
	pause_menu.visible = new_pause_scene


func _unhandled_input(_event):
	if Input.is_action_just_pressed("pause"):
		pause_toggle()
		get_viewport().set_input_as_handled()


func _on_pause_menu_exit():
	SceneChanger.change_scene("res://menu/main_menu.tscn")
	pause_toggle()
