extends KinematicBody2D

export var speed = 250
export var acceleration = 0.1
export var friction = 0.1
var lifepoints = 100
export var lifepoints_max = 100
var velocity = Vector2()


func _physics_process(delta):
	update_gui()
	check_if_alive()
	var direction = get_input()
	if direction.length() > 0:
		velocity = lerp(velocity, direction.normalized() * speed, acceleration)
	else:
		velocity = lerp(velocity, Vector2.ZERO, friction)
	velocity = move_and_slide(velocity)


func get_input():
	var input = Vector2()
	if Input.is_action_pressed("right"):
		input.x += 1
	if Input.is_action_pressed("left"):
		input.x -= 1
	if Input.is_action_pressed("up"):
		input.y -= 1
	if Input.is_action_pressed("down"):
		input.y += 1
	return input


func hurt(damage):
	lifepoints -= damage
	print(lifepoints)


func check_if_alive():
	if lifepoints <= 0:
		game_over()


func update_gui():
	get_tree().call_group("GUI", "update_lifepoints", lifepoints, lifepoints_max)


func game_over():
	print("game over")

