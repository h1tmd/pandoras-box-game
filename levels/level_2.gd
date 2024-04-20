extends Node2D

func _ready():
	if not MusicPlayer.playing:
		MusicPlayer.stream = load("res://assets/audio/music/A Bone To Pick - Dungeon.mp3")
		MusicPlayer.play()
