extends KinematicBody2D
onready var player = $"../player"

func _physics_process(delta):
	if Input.is_action_pressed("input_m1"):
		visible = true
	else:
		visible = false
	position.x = player.position.x
	position.y = player.position.y - 10
	look_at(get_global_mouse_position())
	
