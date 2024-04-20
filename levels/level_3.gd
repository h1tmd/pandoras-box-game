extends Node2D

func _ready():
	if not MusicPlayer.playing:
		MusicPlayer.stream = load("res://assets/audio/music/Evil Wizard - Boss Room.mp3")
		MusicPlayer.play()
