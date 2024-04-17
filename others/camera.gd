extends Camera2D

@export var Chara : Node2D = null

func _process(_delta):
	var chara_x = Chara.get_position().x
	if chara_x > position.x + 670:
		position.x = chara_x - 670
