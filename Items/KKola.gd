extends Area2D


var health = 10


func _ready():
	pass


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		body.drink(10)
		queue_free()
