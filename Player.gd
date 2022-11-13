extends KinematicBody2D


export(PackedScene) var stomp_scene
export var speed = 200
export var acceleration = 0.1
export var friction = 0.1
var lifepoints = 100
export var lifepoints_max = 100
var velocity = Vector2()
var xp = 0
var next_level = 100
var level = 1


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
	check_for_level_up()
	var input = Vector2()
	if Input.is_action_pressed("right"):
		input.x += 1
	if Input.is_action_pressed("left"):
		input.x -= 1
	if Input.is_action_pressed("up"):
		input.y -= 1
	if Input.is_action_pressed("down"):
		input.y += 1
	if Input.is_action_just_pressed("pause"):
		lvl_up_options()
	return input


func check_for_level_up():
	if xp >= next_level:
		xp -= next_level
		level_up()


func level_up():
	level += 1
	next_level = int(next_level * 1.1)
	lvl_up_options()


func lvl_up_options():
	var random_upgrade = randi() % 2
	print(random_upgrade)
	if random_upgrade == 0:
		lifepoints_max += 10
	elif random_upgrade == 1:
		speed += 10
	
	
	lifepoints = lifepoints_max


func hurt(damage):
	lifepoints -= damage


func check_if_alive():
	if lifepoints <= 0:
		game_over()


func update_gui():
	get_tree().call_group("GUI", "update_lifepoints", lifepoints, lifepoints_max)
	get_tree().call_group("GUI", "update_level", xp, next_level)


func add_xp(x):
	xp += x
	

func game_over():
#	get_tree().change_scene("res://Menu.tscn")
	pass

func drink(x):
	lifepoints += x
	if lifepoints > lifepoints_max:
		lifepoints = lifepoints_max

#WEAPONS ARE INSTANCED HERE


func stomp():
	var b = stomp_scene.instance()
	add_child(b)


func _on_StomptTimer_timeout():
	stomp()


func _on_BtnContinue_pressed():
	$Popup.hide()
	get_tree().paused = false
