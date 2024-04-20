extends ParallaxBackground

var scroll_speed = 80

func _process(delta):
	scroll_offset.x -= scroll_speed * delta
