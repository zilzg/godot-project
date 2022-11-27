extends KinematicBody2D
const nome = 'Muliro'
var velocity = Vector2()
var direction
var speed = 120 # 120
var gravity = 10 # 16
var jumpForce = 300 # 352
var minJump = 176 # 176
var acceleration = 20 # 20
var slowdown = 60 # 60
var maxFallSpeed = 500 # 500

func _physics_process(delta):
	velocity.y += gravity
	if velocity.y > maxFallSpeed:
		velocity.y = maxFallSpeed
	
	direction = Input.get_axis("input_left","input_right")
	if direction != 0:
		velocity.x = move_toward(velocity.x, direction * speed, acceleration)
	else:
		velocity.x = move_toward(velocity.x, 0, slowdown)
	
	if is_on_floor() and Input.is_action_just_pressed("input_jump"): 
		velocity.y = -jumpForce
	elif Input.is_action_just_released("input_jump"):
		if velocity.y < -minJump: 
			velocity.y = -minJump
		elif velocity.y < 0:
			velocity.y /= 2
	
	if direction > 0: get_node("Sprite").set_flip_h (false)
	if direction < 0: get_node("Sprite").set_flip_h(true)
		
	velocity = move_and_slide(velocity,Vector2(0,-1))
	
	
	
