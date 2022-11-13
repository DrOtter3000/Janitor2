extends KinematicBody2D


export(PackedScene) var cola_bottle
var player_in_range = false
export var damage = 10
export var lifepoints = 100
export var speed = 150
onready var player = get_parent().get_node("Player")
var path_to_player = null


func _ready():
	randomize()


func _process(delta):
	follow_player()
	move_and_slide(path_to_player * speed)


func hurt(x):
	lifepoints -= x
	if lifepoints <= 0:
		die()


func follow_player():
	path_to_player = (player.global_position - global_position).normalized()


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		player.hurt(damage)
		$HurtTimer.start()

func _on_Area2D_body_exited(body):
	if body.name == "Player":
		player_in_range = false
		$HurtTimer.stop()


func _on_HurtTimer_timeout():
	player.hurt(damage)


func die():
	var luck = randi() % 2
	if luck == 1:
		print("drop")
		drop_cola()
	queue_free()


func drop_cola():
	var kkola = cola_bottle.instance()
	kkola.global_position = global_position
	get_parent().add_child(kkola)

