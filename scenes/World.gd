extends TileMap
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
enum TileSetIDs{WALL, LAVA, GREEN, WATER, SAND}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func player_tile_interact(player):
	var cellPos = world_to_map(player.position)
	var cell_tile_id = get_cellv(cellPos)
	print(cell_tile_id)
	match cell_tile_id:
		-1:
			player.speed = 200
		0:
			var TileSetCoords = get_cell_autotile_coord(cellPos.x, cellPos.y)
			print("TileX: ", TileSetCoords.x, " TileY: ", TileSetCoords.y)
			match int(TileSetCoords.x):
				TileSetIDs.LAVA:
					player.speed = 50
					$"/root/GlobalScript".emit_signal("player_hit", 1, "lava")
				TileSetIDs.WATER: 
					player.speed = 250
				TileSetIDs.SAND:
					player.speed = 100
