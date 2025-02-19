##extends CharacterBody3D
##
##const SPEED = 5.0
##const JUMP_VELOCITY = 4.5
##const MOUSE_SENSITIVITY = 0.003
##
### Get the gravity from the project settings
##var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
##
### Reference to nodes
##@onready var spring_arm: Node3D = $SpringArm3D
##@onready var camera: Camera3D = $SpringArm3D/Camera3D
##
##func _ready():
	### Set up camera
	##spring_arm.spring_length = 5
	##spring_arm.position.y = 2
	##
	##Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
##
##func _physics_process(delta):
	### Add gravity
	##if not is_on_floor():
		##velocity.y -= gravity * delta
##
	### Handle Jump
	##if Input.is_action_pressed("ui_accept") and is_on_floor():
		##velocity.y = JUMP_VELOCITY
##
	### Get input direction using arrow keys
	##var direction = Vector3.ZERO
	##
	##if Input.is_action_pressed("ui_right"):
		##direction.x += 1
	##if Input.is_action_pressed("ui_left"):
		##direction.x -= 1
	##if Input.is_action_pressed("ui_down"):
		##direction.z += 1
	##if Input.is_action_pressed("ui_up"):
		##direction.z -= 1
##
	##if direction != Vector3.ZERO:
		##direction = direction.normalized()
		### Make the character face the movement direction
		##look_at(position + Vector3(direction.x, 0, direction.z))
		### Transform the movement direction relative to the camera angle
		##var camera_basis = spring_arm.global_transform.basis
		##direction = (camera_basis * Vector3(direction.x, 0, direction.z)).normalized()
		##
		##velocity.x = direction.x * SPEED
		##velocity.z = direction.z * SPEED
	##else:
		##velocity.x = move_toward(velocity.x, 0, SPEED)
		##velocity.z = move_toward(velocity.z, 0, SPEED)
##
	##move_and_slide()
##
##func _unhandled_input(event):
	##if event is InputEventMouseMotion:
		##spring_arm.rotate_y(-event.relative.x * MOUSE_SENSITIVITY)
		##spring_arm.rotate_x(-event.relative.y * MOUSE_SENSITIVITY)
		##spring_arm.rotation.x = clamp(spring_arm.rotation.x, -1.5, 1.5)
	##
	##if event.is_action_pressed("ui_cancel"):
		##if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			##Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		##else:
			##Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
#
#extends CharacterBody3D
#
#const SPEED = 5.0
#const JUMP_VELOCITY = 4.5
#const MOUSE_SENSITIVITY = 0.003
#
## Get the gravity from the project settings
#var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
#
## Reference to nodes
#@onready var spring_arm: Node3D = $SpringArm3D
#@onready var camera: Camera3D = $SpringArm3D/Camera3D
#
#func _ready():
	#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
#
#func _unhandled_input(event):
	#if event is InputEventMouseMotion:
		## Rotate left/right
		#rotate_y(-event.relative.x * MOUSE_SENSITIVITY)
		## Only rotate the spring arm if it exists
		#if spring_arm:
			#spring_arm.rotate_x(-event.relative.y * MOUSE_SENSITIVITY)
			#spring_arm.rotation.x = clamp(spring_arm.rotation.x, -1.5, 1.5)
	#
	## Toggle mouse capture
	#if event.is_action_pressed("ui_cancel"):
		#if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			#Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		#else:
			#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
#
#func _physics_process(delta):
	## Add gravity
	#if not is_on_floor():
		#velocity.y -= gravity * delta
#
	## Handle Jump
	#if Input.is_action_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get input direction using arrow keys
	#var direction = Vector3.ZERO
	#
	#if Input.is_action_pressed("ui_right"):
		#direction.x += 1
	#if Input.is_action_pressed("ui_left"):
		#direction.x -= 1
	#if Input.is_action_pressed("ui_down"):
		#direction.z += 1
	#if Input.is_action_pressed("ui_up"):
		#direction.z -= 1
#
	#if direction != Vector3.ZERO:
		#direction = direction.normalized()
		#velocity.x = direction.x * SPEED
		#velocity.z = direction.z * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
		#velocity.z = move_toward(velocity.z, 0, SPEED)
#
	#move_and_slide()
	
	
	
	#
#extends CharacterBody3D
#
#const SPEED = 5.0
#const JUMP_VELOCITY = 4.5
#const MOUSE_SENSITIVITY = 0.003
#
## Get the gravity from the project settings
#var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
#
## Reference to nodes
#@onready var spring_arm: Node3D = $SpringArm3D
#@onready var camera: Camera3D = $SpringArm3D/Camera3D
#
#func _ready():
	## Set up the spring arm properties if they're not already set in the editor
	#if spring_arm:
		#spring_arm.spring_length = 5
		#spring_arm.position.y = 1.5  # Adjust this based on character height
	#
	#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	#
	## Ensure player starts on ground by placing them above the ground plane
	#position.y = 0.0  # Adjust this based on your character's collision height
#
#func _unhandled_input(event):
	#if event is InputEventMouseMotion:
		## Rotate left/right
		#rotate_y(-event.relative.x * MOUSE_SENSITIVITY)
		## Only rotate the spring arm if it exists
		#if spring_arm:
			#spring_arm.rotate_x(-event.relative.y * MOUSE_SENSITIVITY)
			#spring_arm.rotation.x = clamp(spring_arm.rotation.x, -1.5, 1.5)
	#
	## Toggle mouse capture
	#if event.is_action_pressed("ui_cancel"):
		#if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			#Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		#else:
			#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
#
#func _physics_process(delta):
	## Add gravity
	#if not is_on_floor():
		#velocity.y -= gravity * delta
	#
	## Handle Jump
	#if Input.is_action_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
	#
	## Get input direction using arrow keys
	#var direction = Vector3.ZERO
	#
	#if Input.is_action_pressed("ui_right"):
		#direction.x += 1
	#if Input.is_action_pressed("ui_left"):
		#direction.x -= 1
	#if Input.is_action_pressed("ui_down"):
		#direction.z += 1
	#if Input.is_action_pressed("ui_up"):
		#direction.z -= 1
	#
	#if direction != Vector3.ZERO:
		#direction = direction.normalized()
		#
		## Transform direction relative to player's rotation
		#direction = direction.rotated(Vector3.UP, rotation.y)
		#
		#velocity.x = direction.x * SPEED
		#velocity.z = direction.z * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
		#velocity.z = move_toward(velocity.z, 0, SPEED)
	#
	#move_and_slide()
	#
	## Debug: Print whether player is on floor
	#if OS.is_debug_build():
		#if not is_on_floor():
			#print("Player is not on floor")
			

extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const MOUSE_SENSITIVITY = 0.003

# Get the gravity from the project settings
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

# Reference to nodes
@onready var spring_arm: Node3D = $SpringArm3D
@onready var camera: Camera3D = $SpringArm3D/Camera3D

func _ready():
	# Ensure the player starts on the ground
	position.y = 1.0  # Adjust based on character height

	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		# Rotate player left/right
		rotate_y(-event.relative.x * MOUSE_SENSITIVITY)
		# Rotate camera up/down with limits
		if spring_arm:
			spring_arm.rotate_x(-event.relative.y * MOUSE_SENSITIVITY)
			spring_arm.rotation.x = clamp(spring_arm.rotation.x, -1.5, 1.5)

	# Toggle mouse capture
	if event.is_action_pressed("ui_cancel"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(delta):
	# Apply gravity
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	# Handle Jump
	if Input.is_action_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Get input direction
	var direction = Vector3.ZERO
	
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.z += 1
	if Input.is_action_pressed("ui_up"):
		direction.z -= 1
	
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		
		# Transform direction relative to player's rotation
		direction = direction.rotated(Vector3.UP, rotation.y)
		
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	move_and_slide()  # Godot 4 now only uses move_and_slide()
	
	# Debug: Print floor status
	if OS.is_debug_build():
		if not is_on_floor():
			print("Player is not on floor")
