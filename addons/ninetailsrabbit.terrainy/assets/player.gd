extends CharacterBody3D

@export var speed = 5.0
@export var jump_force = 5.0
@export var gravity = 9.8

var velocity_y = 0.0

func _physics_process(delta):
	var input_dir = Vector3.ZERO
	if Input.is_action_pressed("ui_up"):
		input_dir.z -= 1
	if Input.is_action_pressed("ui_down"):
		input_dir.z += 1
	if Input.is_action_pressed("ui_left"):
		input_dir.x -= 1
	if Input.is_action_pressed("ui_right"):
		input_dir.x += 1
	
	input_dir = input_dir.normalized() * speed
	
	if not is_on_floor():
		velocity_y -= gravity * delta
	else:
		if Input.is_action_just_pressed("jump"):
			velocity_y = jump_force
	
	velocity = Vector3(input_dir.x, velocity_y, input_dir.z)
	move_and_slide()


#extends CharacterBody3D
#
#const SPEED = 5.0
#const JUMP_VELOCITY = 4.5
#var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
#
#func _physics_process(delta):
	#if not is_on_floor():
		#velocity.y -= gravity * delta
#
	#if Input.is_action_just_pressed("jump") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	#var input_dir = Input.get_vector("left", "right", "forward", "backward")
	#var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	#
	#if direction:
		#velocity.x = direction.x * SPEED
		#velocity.z = direction.z * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
		#velocity.z = move_toward(velocity.z, 0, SPEED)
#
	#move_and_slide()
