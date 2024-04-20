extends Node2D

func _ready():
	if not MusicPlayer.playing:
		MusicPlayer.stream = load("res://assets/audio/music/Dainty Forest - Forest.mp3")
		MusicPlayer.play()
