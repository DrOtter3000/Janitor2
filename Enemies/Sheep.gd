extends KinematicBody2D

var player_in_range = false
export var damage = 10
export var speed = 90
onready var player = get_parent().get_node("Player")
var path_to_player = null


func _ready():
	pass # Replace with function body.


func _process(delta):
	follow_player()
	move_and_slide(path_to_player * speed)


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
