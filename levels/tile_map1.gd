extends TileMap

# The coordinates for a placeable mushroom
var placeable : Vector2i = Vector2i.ZERO

func _process(_delta):
	#clear_layer(2)
	#set_layer_modulate(2, Color.WHITE)
	var base_layer : int = 0
	#var ui_layer : int = 2
	#var source_id : int = 0
	#var atlas_coords : Vector2i = Vector2i(5, 4)
	var mouse : Vector2 = get_local_mouse_position()
	var coords : Vector2i = local_to_map(mouse)
	var tile_data : TileData = get_cell_tile_data(base_layer, coords)
	if tile_data:
		# Break when null
		while tile_data:
			# Go up
			coords.y -= 1
			tile_data = get_cell_tile_data(base_layer, coords)
		# Once exited, check last tile
		coords.y += 1
		tile_data = get_cell_tile_data(base_layer, coords)
		var can_place_mushroom : bool = tile_data.get_custom_data("can_place_mushroom")
		coords.y -= 1
		#set_cell(ui_layer, coords, source_id, atlas_coords)
		if can_place_mushroom:
			# Put indicator
			placeable = coords
		else:
			#set_layer_modulate(2, Color.RED)
			placeable = Vector2i.ZERO
	else:
		# Check the below tile
		tile_data = get_cell_tile_data(base_layer, Vector2i(coords.x, coords.y + 1))
		#set_cell(ui_layer, coords, source_id, atlas_coords)
		if tile_data:
			var can_place_mushroom : bool = tile_data.get_custom_data("can_place_mushroom")
			if can_place_mushroom:
				# Put indicator
				placeable = coords
			else:
				#set_layer_modulate(2, Color.RED)
				placeable = Vector2i.ZERO
		else:
			#set_layer_modulate(2, Color.RED)
			placeable = Vector2i.ZERO


func _unhandled_input(_event):
	if Input.is_action_just_pressed("left_click"):
		var layer : int = 1
		var source_id : int = 1
		var tile_id : int = 1
		if placeable != Vector2i.ZERO:
			clear_layer(layer)
			# Place mushroom at coordinates
			set_cell(layer, placeable, source_id, Vector2i.ZERO, tile_id)
			# Add delay to connect signal
			await get_tree().create_timer(0.05).timeout
			if get_child_count() > 0:
				get_child(0).connect("jumped", clear_all)

# Clear up leftover instances
func clear_all():
	clear_layer(1)
