extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(delta):
	var PShape = $Player/CollisionShape2D.shape as CircleShape2D
	var PPos = $Player.position
	var PRadius = PShape.radius
	var PSpriteNode := $Player/AnimatedSprite2D as Node2D
	var PScale = PSpriteNode.scale
	var PSprite = $Player/AnimatedSprite2D as AnimatedSprite2D
	var PFrames = PSprite.frames
	var PCFrame = PFrames.get_frame(PSprite.animation, PSprite.frame) as Texture2D
	var PSpriteSize = Vector2(PCFrame.get_size().x * PScale.x, PCFrame.get_size().y * PScale.y)
	
	var Player_Top_Left_Coord = Vector2(
		PPos.x - (PSpriteSize.x / 2),
		PPos.y - (PSpriteSize.y / 2))
	
	var Player_Top_Right_Coord = Vector2(
		PPos.x + (PSpriteSize.x / 2),
		PPos.y - (PSpriteSize.y / 2))
		
	var Player_Bottom_Left_Coord = Vector2(
		PPos.x - (PSpriteSize.x / 2),
		PPos.y + (PSpriteSize.y / 2))
		
	var Player_Bottom_Right_Coord = Vector2(
		PPos.x + (PSpriteSize.x / 2),
		PPos.y + (PSpriteSize.y / 2))
		
	var TLTile = $World.get_tile_at_position(Player_Top_Left_Coord)
	var TRTile = $World.get_tile_at_position(Player_Top_Right_Coord)
	var BLTile = $World.get_tile_at_position(Player_Bottom_Left_Coord)
	var BRTile = $World.get_tile_at_position(Player_Bottom_Right_Coord)
	
	#RMEMBER - TILE MAP TILE COORDS ORIGIN = CENTERED 
	#TODO: Finish Collision:
	#	 1 - If no more than 1 tile in contact, skip to step 5
	#    2 Discard lower pecdence tiles  
	#    3 Combine highest same precence tiles into Rect
	#    4 Do Circle/Rect Collision Detection on Rect
	#    5 check current tile against old tile, if changed, update and signal
	#Collision Priority: LAVA, WATER, SAND, GRASS, NOTHING/STONE
	
	#print("Player Postion: ", PPos)
	#print("TL: " , TLTile , " TR: " , TRTile , " BL: " , BLTile , " BR: " , BRTile)
	pass
