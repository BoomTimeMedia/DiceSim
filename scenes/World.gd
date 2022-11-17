extends Node2D
enum TileSetIDs{EMPTY, WALL, LAVA, GREEN, WATER, SAND}
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func get_tile_at_position(position):
	var CMap = $TerrainCollisionMap as TileMap
	var cellPos = CMap.local_to_map(position)
	var cell_tile_id = CMap.get_cell_atlas_coords(0, cellPos)
	if(cell_tile_id.x < 0):
		return [TileSetIDs.EMPTY, CMap.map_to_local(cellPos)]
	return [cell_tile_id.x * (cell_tile_id.y+1),to_global(CMap.map_to_local(cellPos))]

	
	
	
