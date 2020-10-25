extends KinematicBody2D

const TARGET_FPS = 60

const ACCELERATION = 15
const MAX_SPEED = 200
const FRICTION = 20
const AIR_RESISTANCE = 0
const GRAVITY = 25
const JUMP_FORCE = 600

var motion = Vector2.ZERO

onready var sprite = $Sprite
onready var animationPlayer = $AnimationPlayer

func _physics_process(delta):
	var x_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if x_input != 0:
	
		motion.x += x_input * ACCELERATION * delta * TARGET_FPS
		motion.x = clamp(motion.x, -MAX_SPEED, MAX_SPEED)
	
	motion.y += GRAVITY * delta * TARGET_FPS
	
	if is_on_floor():
		if x_input == 0:
			motion.x = lerp(motion.x, 0, FRICTION * delta)
			
		if Input.is_action_just_pressed("ui_select"):
			motion.y = -JUMP_FORCE
	else:
		
		if Input.is_action_just_released("ui_select") and motion.y < -JUMP_FORCE/2:
			motion.y = -JUMP_FORCE/2
		
		if x_input == 0:
			motion.x = lerp(motion.x, 0, AIR_RESISTANCE * delta)
	
	motion = move_and_slide(motion, Vector2.UP)





		


func _on_p1_body_entered(body):
	if body.get_name()=="player1":
		get_tree().change_scene("res://escenabla.tscn")
	pass # Replace with function body.


func _on_p2_body_entered(body):
	if body.get_name()=="player1":
		get_tree().change_scene("res://bla2.tscn")
	pass # Replace with function body.
