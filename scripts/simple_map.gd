extends Node2D

# Size (in pixels) of one logical tile. Adjust if your tiles are a different size.
const TILE_SIZE := Vector2i(64, 64)

# How many tiles wide & high the prototype map should be.
const MAP_WIDTH := 20
const MAP_HEIGHT := 10
<<<<<<< Updated upstream
<<<<<<< Updated upstream
#this is a testS1232112312
=======
#this is a test1Sds
>>>>>>> Stashed changes
=======
#this is a test1S
>>>>>>> Stashed changes
# Texture from the assets folder that will be used as ground tiles.
const TEXTURE_PATH := "res://assets/PNG/ground_grass_details.png"

#Test
func _ready() -> void:
	# Load the chosen texture once.
	var texture: Texture2D = load(TEXTURE_PATH)
	if texture == null:
		push_error("Could not load texture at %s" % TEXTURE_PATH)
		return

	# Rect defining the portion of the atlas to use for each tile (top-left 64×64 pixels).
	var region_rect := Rect2(Vector2.ZERO, TILE_SIZE)

	# Populate the map as a simple grid of sprites.
	for x in range(MAP_WIDTH):
		for y in range(MAP_HEIGHT):
			var sprite := Sprite2D.new()
			sprite.texture = texture
			sprite.region_enabled = true
			sprite.region_rect = region_rect
			sprite.position = Vector2(x * TILE_SIZE.x, y * TILE_SIZE.y)
			add_child(sprite)

	# Spawn the player in the center of the map.
	var player_scene: PackedScene = preload("res://scenes/Player.tscn")
	var player := player_scene.instantiate()
	player.position = Vector2((MAP_WIDTH / 2.0) * TILE_SIZE.x, (MAP_HEIGHT / 2.0) * TILE_SIZE.y)
	add_child(player) 
