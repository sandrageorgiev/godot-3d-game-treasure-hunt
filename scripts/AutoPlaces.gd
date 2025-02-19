#extends Node3D
#
## Constants for grid spacing and randomization
#const GRID_SIZE = 2.0
#const RANDOM_OFFSET = 1.0
#const PARK_WIDTH = 50
#const PARK_LENGTH = 50
#const PATH_WIDTH = 3
#
## Preload all the assets with correct paths
#@onready var bench = preload("res://addons/tiny_treats_pretty_park_set/Assets/gltf/bench.gltf")
#@onready var tree = preload("res://addons/tiny_treats_pretty_park_set/Assets/gltf/tree.gltf")
#@onready var bush = preload("res://addons/tiny_treats_pretty_park_set/Assets/gltf/bush.gltf")
#@onready var flower = preload("res://addons/tiny_treats_pretty_park_set/Assets/gltf/flower_A.gltf")
#@onready var street_lantern = preload("res://addons/tiny_treats_pretty_park_set/Assets/gltf/street_lantern.gltf")
#@onready var fountain = preload("res://addons/tiny_treats_pretty_park_set/Assets/gltf/fountain.gltf")
#@onready var hedge_straight = preload("res://addons/tiny_treats_pretty_park_set/Assets/gltf/hedge_straight.gltf")
#@onready var hedge_corner = preload("res://addons/tiny_treats_pretty_park_set/Assets/gltf/hedge_corner.gltf")
#@onready var cobble_stones = preload("res://addons/tiny_treats_pretty_park_set/Assets/gltf/cobble_stones.gltf")
#@onready var floor_grass = preload("res://addons/tiny_treats_pretty_park_set/Assets/gltf/floor_grass_sliced_A.gltf")
#
#func _ready():
	#create_ground_collision()  # Add ground collision first
	#create_grass_floor()
	#create_paths()
	#place_hedges()
	#place_benches()
	#place_flowers()
	#place_bushes()
	#place_lanterns()
	#
	## Place fountain last
	#place_with_collision(fountain, Vector3(0, 0, 0), Vector3(2, 1, 2))
#
#func create_ground_collision():
	#var ground = StaticBody3D.new()
	#add_child(ground)
	#
	#var ground_collision = CollisionShape3D.new()
	#var ground_shape = BoxShape3D.new()
	#ground_shape.size = Vector3(PARK_WIDTH, 0.1, PARK_LENGTH) 
	#ground_collision.shape = ground_shape
	#ground.add_child(ground_collision)
	#ground.position = Vector3(0, -0.05, 0)  # Slightly below the visual floor to avoid z-fighting
	#
	## Set the collision layer/mask as needed
	#ground.collision_layer = 1
	#ground.collision_mask = 0  # Only collide with the player
#
#func create_grass_floor():
	#for x in range(-PARK_WIDTH/2, PARK_WIDTH/2, GRID_SIZE):
		#for z in range(-PARK_LENGTH/2, PARK_LENGTH/2, GRID_SIZE):
			#var grass_instance = floor_grass.instantiate()
			#add_child(grass_instance)
			#grass_instance.position = Vector3(x, 0, z)
#
#func create_paths():
	#for x in range(-PARK_WIDTH/4, PARK_WIDTH/4):
		#for z in range(-PATH_WIDTH/2, PATH_WIDTH/2):
			## Horizontal path
			#place_with_collision(cobble_stones, Vector3(x * GRID_SIZE, 0, z * GRID_SIZE), Vector3(2, 0.1, 2))
			#
			## Vertical path
			#place_with_collision(cobble_stones, Vector3(z * GRID_SIZE, 0, x * GRID_SIZE), Vector3(2, 0.1, 2))
#
#func place_hedges():
	#var perimeter_size = 15  
	#var hedge_spacing = 2.0
	#
	#for x in range(-perimeter_size, perimeter_size + 1, hedge_spacing):
		#for z in [-perimeter_size, perimeter_size]:
			#place_with_collision(hedge_straight, Vector3(x, 0, z), Vector3(2, 1, 0.5))
	#
	#for z in range(-perimeter_size, perimeter_size + 1, hedge_spacing):
		#for x in [-perimeter_size, perimeter_size]:
			#place_with_collision(hedge_straight, Vector3(x, 0, z), Vector3(2, 1, 0.5), PI/2)
#
	## Place corner hedges
	#var corners = [
		#{"pos": Vector3(-perimeter_size, 0, -perimeter_size), "rot": 0},
		#{"pos": Vector3(perimeter_size, 0, -perimeter_size), "rot": PI/2},
		#{"pos": Vector3(perimeter_size, 0, perimeter_size), "rot": PI},
		#{"pos": Vector3(-perimeter_size, 0, perimeter_size), "rot": -PI/2}
	#]
	#
	#for corner in corners:
		#place_with_collision(hedge_corner, corner.pos, Vector3(1, 1, 1), corner.rot)
#
#func place_benches():
	#var bench_positions = [
		#{"pos": Vector3(8, 0, 4), "rot": PI/2},
		#{"pos": Vector3(-8, 0, 4), "rot": PI/2},
		#{"pos": Vector3(8, 0, -4), "rot": -PI/2},
		#{"pos": Vector3(-8, 0, -4), "rot": -PI/2},
		#{"pos": Vector3(4, 0, 8), "rot": 0},
		#{"pos": Vector3(4, 0, -8), "rot": 0},
		#{"pos": Vector3(-4, 0, 8), "rot": PI},
		#{"pos": Vector3(-4, 0, -8), "rot": PI}
	#]
	#
	#for bench_data in bench_positions:
		#place_with_collision(bench, bench_data.pos, Vector3(2, 1, 0.5), bench_data.rot)
#
#func place_flowers():
	#for _i in range(300):
		#var pos = Vector3(randf_range(-15, 15), 0, randf_range(-15, 15))
		#if abs(pos.x) <= PATH_WIDTH or abs(pos.z) <= PATH_WIDTH:
			#continue
		#place_with_collision(flower, pos, Vector3(0.5, 0.5, 0.5), randf() * PI * 2)
#
#func place_bushes():
	#for _i in range(20):
		#var pos = Vector3(randf_range(-15, 15), 0, randf_range(-15, 15))
		#if abs(pos.x) <= PATH_WIDTH or abs(pos.z) <= PATH_WIDTH:
			#continue
		#place_with_collision(bush, pos, Vector3(1, 1, 1), randf() * PI * 2)
#
#func place_lanterns():
	#var lantern_positions = [
		#Vector3(15, 0, 15),
		#Vector3(-15, 0, 15),
		#Vector3(15, 0, -15),
		#Vector3(-15, 0, -15)
	#]
	#
	#for pos in lantern_positions:
		#place_with_collision(street_lantern, pos, Vector3(0.5, 3, 0.5))
#
## Function to instantiate objects with collision
#func place_with_collision(scene, position, collision_size, rotation_y=0):
	#var instance = scene.instantiate()
	#add_child(instance)
	#instance.position = position
	#instance.rotation.y = rotation_y
#
	## Create a collision body
	#var collision_body = StaticBody3D.new()
	#instance.add_child(collision_body)
#
	## Create a collision shape
	#var collision_shape = CollisionShape3D.new()
	#var shape = BoxShape3D.new()
	#shape.size = collision_size
	#collision_shape.shape = shape
#
	## Add collision shape to the body
	#collision_body.add_child(collision_shape)
	#collision_shape.position = Vector3.ZERO  # Centered
	#
	#return instance




extends Node3D

# Constants for grid spacing and randomization
const GRID_SIZE = 2.0
const RANDOM_OFFSET = 1.0
const PARK_WIDTH = 50
const PARK_LENGTH = 50
const PATH_WIDTH = 3

# Preload assets
@onready var bench = preload("res://addons/tiny_treats_pretty_park_set/Assets/gltf/bench.gltf")
@onready var tree = preload("res://addons/tiny_treats_pretty_park_set/Assets/gltf/tree.gltf")
@onready var bush = preload("res://addons/tiny_treats_pretty_park_set/Assets/gltf/bush.gltf")
@onready var flower = preload("res://addons/tiny_treats_pretty_park_set/Assets/gltf/flower_A.gltf")
@onready var street_lantern = preload("res://addons/tiny_treats_pretty_park_set/Assets/gltf/street_lantern.gltf")
@onready var fountain = preload("res://addons/tiny_treats_pretty_park_set/Assets/gltf/fountain.gltf")
@onready var hedge_straight = preload("res://addons/tiny_treats_pretty_park_set/Assets/gltf/hedge_straight.gltf")
@onready var hedge_corner = preload("res://addons/tiny_treats_pretty_park_set/Assets/gltf/hedge_corner.gltf")
@onready var cobble_stones = preload("res://addons/tiny_treats_pretty_park_set/Assets/gltf/cobble_stones.gltf")
@onready var floor_grass = preload("res://addons/tiny_treats_pretty_park_set/Assets/gltf/floor_grass_sliced_A.gltf")

func _ready():
	create_ground_collision()  # Ground first
	create_grass_floor()
	create_paths()
	place_hedges()
	place_benches()
	place_flowers()
	place_bushes()
	place_lanterns()

	# Place fountain last
	place_with_collision(fountain, Vector3(0, 0, 0), Vector3(2, 1, 2))

func create_ground_collision():
	var ground = StaticBody3D.new()
	add_child(ground)

	var ground_collision = CollisionShape3D.new()
	var ground_shape = BoxShape3D.new()
	ground_shape.size = Vector3(PARK_WIDTH, 0.2, PARK_LENGTH)
	ground_collision.shape = ground_shape
	ground.add_child(ground_collision)

	ground.position = Vector3(0, -0.1, 0)  # Lowered to avoid floating issues
	ground.collision_layer = 1
	ground.collision_mask = 0  # Only collide with the player

func create_grass_floor():
	for x in range(-PARK_WIDTH/2, PARK_WIDTH/2, GRID_SIZE):
		for z in range(-PARK_LENGTH/2, PARK_LENGTH/2, GRID_SIZE):
			var grass_instance = floor_grass.instantiate()
			add_child(grass_instance)
			grass_instance.position = Vector3(x, -0.05, z)  # Ensure proper grounding

func create_paths():
	for x in range(-PARK_WIDTH/4, PARK_WIDTH/4):
		for z in range(-PATH_WIDTH/2, PATH_WIDTH/2):
			# Horizontal path
			place_with_collision(cobble_stones, Vector3(x * GRID_SIZE, -0.05, z * GRID_SIZE), Vector3(2, 0.1, 2))

			# Vertical path
			place_with_collision(cobble_stones, Vector3(z * GRID_SIZE, -0.05, x * GRID_SIZE), Vector3(2, 0.1, 2))

func place_hedges():
	var perimeter_size = 15
	var hedge_spacing = 2.0

	for x in range(-perimeter_size, perimeter_size + 1, hedge_spacing):
		for z in [-perimeter_size, perimeter_size]:
			place_with_collision(hedge_straight, Vector3(x, 0, z), Vector3(2, 1, 0.5))

	for z in range(-perimeter_size, perimeter_size + 1, hedge_spacing):
		for x in [-perimeter_size, perimeter_size]:
			place_with_collision(hedge_straight, Vector3(x, 0, z), Vector3(2, 1, 0.5), PI/2)

	# Corners
	var corners = [
		{"pos": Vector3(-perimeter_size, 0, -perimeter_size), "rot": 0},
		{"pos": Vector3(perimeter_size, 0, -perimeter_size), "rot": PI/2},
		{"pos": Vector3(perimeter_size, 0, perimeter_size), "rot": PI},
		{"pos": Vector3(-perimeter_size, 0, perimeter_size), "rot": -PI/2}
	]

	for corner in corners:
		place_with_collision(hedge_corner, corner.pos, Vector3(1, 1, 1), corner.rot)

func place_benches():
	var bench_positions = [
		{"pos": Vector3(8, 0, 4), "rot": PI/2},
		{"pos": Vector3(-8, 0, 4), "rot": PI/2},
		{"pos": Vector3(8, 0, -4), "rot": -PI/2},
		{"pos": Vector3(-8, 0, -4), "rot": -PI/2},
		{"pos": Vector3(4, 0, 8), "rot": 0},
		{"pos": Vector3(4, 0, -8), "rot": 0},
		{"pos": Vector3(-4, 0, 8), "rot": PI},
		{"pos": Vector3(-4, 0, -8), "rot": PI}
	]

	for bench_data in bench_positions:
		place_with_collision(bench, bench_data.pos, Vector3(2, 1, 0.5), bench_data.rot)

func place_flowers():
	for _i in range(300):
		var pos = Vector3(randf_range(-15, 15), 0, randf_range(-15, 15))
		if abs(pos.x) <= PATH_WIDTH or abs(pos.z) <= PATH_WIDTH:
			continue
		place_with_collision(flower, pos, Vector3(0.5, 0.5, 0.5), randf() * PI * 2)

func place_bushes():
	for _i in range(20):
		var pos = Vector3(randf_range(-15, 15), 0, randf_range(-15, 15))
		if abs(pos.x) <= PATH_WIDTH or abs(pos.z) <= PATH_WIDTH:
			continue
		place_with_collision(bush, pos, Vector3(1, 1, 1), randf() * PI * 2)

func place_lanterns():
	var lantern_positions = [
		Vector3(15, 0, 15),
		Vector3(-15, 0, 15),
		Vector3(15, 0, -15),
		Vector3(-15, 0, -15)
	]

	for pos in lantern_positions:
		place_with_collision(street_lantern, pos, Vector3(0.5, 3, 0.5))

# Function to instantiate objects with collision
func place_with_collision(scene, position, collision_size, rotation_y=0):
	var instance = scene.instantiate()
	add_child(instance)
	instance.position = position
	instance.rotation.y = rotation_y

	# Create a collision body
	var collision_body = StaticBody3D.new()
	instance.add_child(collision_body)

	# Create a collision shape
	var collision_shape = CollisionShape3D.new()
	var shape = BoxShape3D.new()
	shape.size = collision_size
	collision_shape.shape = shape

	collision_body.add_child(collision_shape)
	collision_shape.position = Vector3.ZERO  # Centered

	return instance

#extends Node3D
#
## Constants for grid spacing and randomization
#const GRID_SIZE = 2.0
#const RANDOM_OFFSET = 1.0
#const PARK_WIDTH = 50
#const PARK_LENGTH = 50
#const PATH_WIDTH = 3
#
## Preload all the assets with correct paths
#@onready var bench = preload("res://addons/tiny_treats_pretty_park_set/Assets/gltf/bench.gltf")
#@onready var tree = preload("res://addons/tiny_treats_pretty_park_set/Assets/gltf/tree.gltf")
#@onready var bush = preload("res://addons/tiny_treats_pretty_park_set/Assets/gltf/bush.gltf")
#@onready var flower = preload("res://addons/tiny_treats_pretty_park_set/Assets/gltf/flower_A.gltf")
#@onready var street_lantern = preload("res://addons/tiny_treats_pretty_park_set/Assets/gltf/street_lantern.gltf")
#@onready var fountain = preload("res://addons/tiny_treats_pretty_park_set/Assets/gltf/fountain.gltf")
#@onready var hedge_straight = preload("res://addons/tiny_treats_pretty_park_set/Assets/gltf/hedge_straight.gltf")
#@onready var hedge_corner = preload("res://addons/tiny_treats_pretty_park_set/Assets/gltf/hedge_corner.gltf")
#@onready var cobble_stones = preload("res://addons/tiny_treats_pretty_park_set/Assets/gltf/cobble_stones.gltf")
#@onready var floor_grass = preload("res://addons/tiny_treats_pretty_park_set/Assets/gltf/floor_grass_sliced_A.gltf")
#
#func _ready():
	#create_grass_floor()
	#create_paths()
	#place_hedges()
	#place_benches()
	#place_flowers()
	#place_bushes()
	#place_lanterns()
	#
	## Place fountain last
	#place_with_collision(fountain, Vector3(0, 0, 0), Vector3(2, 1, 2))
#
#func create_grass_floor():
	#for x in range(-PARK_WIDTH/2, PARK_WIDTH/2, GRID_SIZE):
		#for z in range(-PARK_LENGTH/2, PARK_LENGTH/2, GRID_SIZE):
			#var grass_instance = floor_grass.instantiate()
			#add_child(grass_instance)
			#grass_instance.position = Vector3(x, 0, z)
#
#func create_paths():
	#for x in range(-PARK_WIDTH/4, PARK_WIDTH/4):
		#for z in range(-PATH_WIDTH/2, PATH_WIDTH/2):
			## Horizontal path
			#place_with_collision(cobble_stones, Vector3(x * GRID_SIZE, 0, z * GRID_SIZE), Vector3(2, 0.1, 2))
			#
			## Vertical path
			#place_with_collision(cobble_stones, Vector3(z * GRID_SIZE, 0, x * GRID_SIZE), Vector3(2, 0.1, 2))
#
#func place_hedges():
	#var perimeter_size = 15  
	#var hedge_spacing = 2.0
	#
	#for x in range(-perimeter_size, perimeter_size + 1, hedge_spacing):
		#for z in [-perimeter_size, perimeter_size]:
			#place_with_collision(hedge_straight, Vector3(x, 0, z), Vector3(2, 1, 0.5))
	#
	#for z in range(-perimeter_size, perimeter_size + 1, hedge_spacing):
		#for x in [-perimeter_size, perimeter_size]:
			#place_with_collision(hedge_straight, Vector3(x, 0, z), Vector3(2, 1, 0.5), PI/2)
#
	## Place corner hedges
	#var corners = [
		#{"pos": Vector3(-perimeter_size, 0, -perimeter_size), "rot": 0},
		#{"pos": Vector3(perimeter_size, 0, -perimeter_size), "rot": PI/2},
		#{"pos": Vector3(perimeter_size, 0, perimeter_size), "rot": PI},
		#{"pos": Vector3(-perimeter_size, 0, perimeter_size), "rot": -PI/2}
	#]
	#
	#for corner in corners:
		#place_with_collision(hedge_corner, corner.pos, Vector3(1, 1, 1), corner.rot)
#
#func place_benches():
	#var bench_positions = [
		#{"pos": Vector3(8, 0, 4), "rot": PI/2},
		#{"pos": Vector3(-8, 0, 4), "rot": PI/2},
		#{"pos": Vector3(8, 0, -4), "rot": -PI/2},
		#{"pos": Vector3(-8, 0, -4), "rot": -PI/2},
		#{"pos": Vector3(4, 0, 8), "rot": 0},
		#{"pos": Vector3(4, 0, -8), "rot": 0},
		#{"pos": Vector3(-4, 0, 8), "rot": PI},
		#{"pos": Vector3(-4, 0, -8), "rot": PI}
	#]
	#
	#for bench_data in bench_positions:
		#place_with_collision(bench, bench_data.pos, Vector3(2, 1, 0.5), bench_data.rot)
#
#func place_flowers():
	#for _i in range(300):
		#var pos = Vector3(randf_range(-15, 15), 0, randf_range(-15, 15))
		#if abs(pos.x) <= PATH_WIDTH or abs(pos.z) <= PATH_WIDTH:
			#continue
		#place_with_collision(flower, pos, Vector3(0.5, 0.5, 0.5), randf() * PI * 2)
#
#func place_bushes():
	#for _i in range(20):
		#var pos = Vector3(randf_range(-15, 15), 0, randf_range(-15, 15))
		#if abs(pos.x) <= PATH_WIDTH or abs(pos.z) <= PATH_WIDTH:
			#continue
		#place_with_collision(bush, pos, Vector3(1, 1, 1), randf() * PI * 2)
#
#func place_lanterns():
	#var lantern_positions = [
		#Vector3(15, 0, 15),
		#Vector3(-15, 0, 15),
		#Vector3(15, 0, -15),
		#Vector3(-15, 0, -15)
	#]
	#
	#for pos in lantern_positions:
		#place_with_collision(street_lantern, pos, Vector3(0.5, 3, 0.5))
#
## Function to instantiate objects with collision
#func place_with_collision(scene, position, collision_size, rotation_y=0):
	#var instance = scene.instantiate()
	#add_child(instance)
	#instance.position = position
	#instance.rotation.y = rotation_y
#
	## Create a collision body
	#var collision_body = StaticBody3D.new()
	#instance.add_child(collision_body)
#
	## Create a collision shape
	#var collision_shape = CollisionShape3D.new()
	#var shape = BoxShape3D.new()
	#shape.size = collision_size
	#collision_shape.shape = shape
#
	## Add collision shape to the body
	#collision_body.add_child(collision_shape)
	#collision_shape.position = Vector3.ZERO  # Centered

	#return instance

#
#extends Node3D
#
## Constants for grid spacing and randomization
#const GRID_SIZE = 2.0
#const RANDOM_OFFSET = 1.0
#const PARK_WIDTH = 50
#const PARK_LENGTH = 50
#const PATH_WIDTH = 3
#
## Preload all the assets with correct paths
#@onready var bench = preload("res://addons/tiny_treats_pretty_park_set/Assets/gltf/bench.gltf")
#@onready var tree = preload("res://addons/tiny_treats_pretty_park_set/Assets/gltf/tree.gltf")
#@onready var bush = preload("res://addons/tiny_treats_pretty_park_set/Assets/gltf/bush.gltf")
#@onready var flower = preload("res://addons/tiny_treats_pretty_park_set/Assets/gltf/flower_A.gltf")
#@onready var street_lantern = preload("res://addons/tiny_treats_pretty_park_set/Assets/gltf/street_lantern.gltf")
#@onready var fountain = preload("res://addons/tiny_treats_pretty_park_set/Assets/gltf/fountain.gltf")
#@onready var hedge_straight = preload("res://addons/tiny_treats_pretty_park_set/Assets/gltf/hedge_straight.gltf")
#@onready var hedge_corner = preload("res://addons/tiny_treats_pretty_park_set/Assets/gltf/hedge_corner.gltf")
#@onready var cobble_stones = preload("res://addons/tiny_treats_pretty_park_set/Assets/gltf/cobble_stones.gltf")
#@onready var floor_grass = preload("res://addons/tiny_treats_pretty_park_set/Assets/gltf/floor_grass_sliced_A.gltf")
#
#func _ready():
	#create_grass_floor()
	#create_paths()
	#place_hedges()
	#place_benches()
	#place_flowers()
	#place_bushes()
	#place_lanterns()
	#
	## Place fountain last
	#var fountain_instance = fountain.instantiate()
	#add_child(fountain_instance)
	#fountain_instance.position = Vector3(0, 0, 0)
#
#func create_grass_floor():
	#for x in range(-PARK_WIDTH/2, PARK_WIDTH/2, GRID_SIZE):
		#for z in range(-PARK_LENGTH/2, PARK_LENGTH/2, GRID_SIZE):
			#var grass_instance = floor_grass.instantiate()
			#add_child(grass_instance)
			#grass_instance.position = Vector3(x, 0, z)
#
#func create_paths():
	#for x in range(-PARK_WIDTH/4, PARK_WIDTH/4):
		#for z in range(-PATH_WIDTH/2, PATH_WIDTH/2):
			## Horizontal path
			#var stone = cobble_stones.instantiate()
			#add_child(stone)
			#stone.position = Vector3(x * GRID_SIZE, 0, z * GRID_SIZE)
			#
			## Vertical path
			#stone = cobble_stones.instantiate()
			#add_child(stone)
			#stone.position = Vector3(z * GRID_SIZE, 0, x * GRID_SIZE)
#
#func place_hedges():
	#var perimeter_size = 15  # Adjust based on your park size
	#var hedge_spacing = 2.0
	#
	## Place hedges along X axis
	#for x in range(-perimeter_size, perimeter_size + 1, hedge_spacing):
		#for z in [-perimeter_size, perimeter_size]:
			#var hedge = hedge_straight.instantiate()
			#add_child(hedge)
			#hedge.position = Vector3(x, 0, z)
	#
	## Place hedges along Z axis
	#for z in range(-perimeter_size, perimeter_size + 1, hedge_spacing):
		#for x in [-perimeter_size, perimeter_size]:
			#var hedge = hedge_straight.instantiate()
			#add_child(hedge)
			#hedge.position = Vector3(x, 0, z)
			#hedge.rotation.y = PI/2
#
	## Place corner hedges
	#var corners = [
		#{"pos": Vector3(-perimeter_size, 0, -perimeter_size), "rot": 0},
		#{"pos": Vector3(perimeter_size, 0, -perimeter_size), "rot": PI/2},
		#{"pos": Vector3(perimeter_size, 0, perimeter_size), "rot": PI},
		#{"pos": Vector3(-perimeter_size, 0, perimeter_size), "rot": -PI/2}
	#]
	#
	#for corner in corners:
		#var hedge = hedge_corner.instantiate()
		#add_child(hedge)
		#hedge.position = corner.pos
		#hedge.rotation.y = corner.rot
#
#func place_benches():
	#var bench_positions = [
		#{"pos": Vector3(8, 0, 4), "rot": PI/2},
		#{"pos": Vector3(-8, 0, 4), "rot": PI/2},
		#{"pos": Vector3(8, 0, -4), "rot": -PI/2},
		#{"pos": Vector3(-8, 0, -4), "rot": -PI/2},
		#{"pos": Vector3(4, 0, 8), "rot": 0},
		#{"pos": Vector3(4, 0, -8), "rot": 0},
		#{"pos": Vector3(-4, 0, 8), "rot": PI},
		#{"pos": Vector3(-4, 0, -8), "rot": PI}
	#]
	#
	#for bench_data in bench_positions:
		#var bench_instance = bench.instantiate()
		#add_child(bench_instance)
		#bench_instance.position = bench_data.pos
		#bench_instance.rotation.y = bench_data.rot
#
#func place_flowers():
	## Place flowers throughout the park
	#for _i in range(300):  # Increased number of flowers
		#var pos = Vector3(
			#randf_range(-15, 15),
			#0,
			#randf_range(-15, 15)
		#)
		#
		## Avoid paths
		#if abs(pos.x) <= PATH_WIDTH or abs(pos.z) <= PATH_WIDTH:
			#continue
			#
		#var flower_instance = flower.instantiate()
		#add_child(flower_instance)
		#flower_instance.position = pos
		#flower_instance.rotation.y = randf() * PI * 2
		#
	## Add extra flowers near benches
	#add_flowers_near_benches()
#
#func add_flowers_near_benches():
	#var bench_positions = [
		#Vector3(8, 0, 4), Vector3(-8, 0, 4),
		#Vector3(8, 0, -4), Vector3(-8, 0, -4),
		#Vector3(4, 0, 8), Vector3(4, 0, -8),
		#Vector3(-4, 0, 8), Vector3(-4, 0, -8)
	#]
	#
	#for bench_pos in bench_positions:
		#for _i in range(8):  # 8 flowers per bench
			#var flower_instance = flower.instantiate()
			#add_child(flower_instance)
			#var offset = Vector3(
				#randf_range(-1.5, 1.5),
				#0,
				#randf_range(-1.5, 1.5)
			#)
			#flower_instance.position = bench_pos + offset
			#flower_instance.rotation.y = randf() * PI * 2
#
#
#
#func place_bushes():
	#for _i in range(20):
		#var bush_instance = bush.instantiate()
		#add_child(bush_instance)
		#var pos = Vector3(
			#randf_range(-15, 15),
			#0,
			#randf_range(-15, 15)
		#)
		## Avoid paths and fountain area
		#if abs(pos.x) <= PATH_WIDTH or abs(pos.z) <= PATH_WIDTH:
			#continue
		#bush_instance.position = pos
		#bush_instance.rotation.y = randf() * PI * 2
#
#func place_lanterns():
	#var lantern_positions = [
		#Vector3(15, 0, 15),
		#Vector3(-15, 0, 15),
		#Vector3(15, 0, -15),
		#Vector3(-15, 0, -15)
	#]
	#
	#for pos in lantern_positions:
		#var lantern = street_lantern.instantiate()
		#add_child(lantern)
		#lantern.position = pos
		#
		#

#extends Node3D
#
#@export var gltf_paths: Array[String]  # List of GLTF file paths
#@export var spawn_count: int = 50  # Number of objects
#@export var spawn_area: Vector2 = Vector2(50, 50)  # Width and depth of spawn area
#@export var terrain: Node3D  # Assign terrain node (optional for height adjustment)
#
#func _ready():
	#if gltf_paths.is_empty():
		#push_error("No GLTF file paths assigned!")
		#return
#
	#for i in range(spawn_count):
		#var gltf_scene = _load_random_gltf()
		#if not gltf_scene:
			#continue  # Skip if loading failed
#
		#var instance = gltf_scene.instantiate()
#
		#var x = randf_range(-spawn_area.x / 2, spawn_area.x / 2)
		#var z = randf_range(-spawn_area.y / 2, spawn_area.y / 2)
		#var y = _get_terrain_height(x, z)  # Adjust height based on terrain
#
		#instance.transform.origin = Vector3(x, y, z)
		#add_child(instance)
#
#func _load_random_gltf() -> PackedScene:
	#var path = gltf_paths[randi() % gltf_paths.size()]
	#return load(path) as PackedScene
#
#func _get_terrain_height(x: float, z: float) -> float:
	#if terrain and terrain.has_method("get_height_at"):
		#return terrain.call("get_height_at", x, z)
	#return 0  # Default ground level if terrain height is not available
