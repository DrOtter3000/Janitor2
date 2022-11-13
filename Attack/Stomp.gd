extends AnimatedSprite

var level = 1
export var base_damage = 90
var damage = base_damage * level


func _ready():
	pass

func _on_DamageArea_body_entered(body):
	if body.is_in_group("Enemies"):
		body.hurt(damage)


func _on_HurtTimer_timeout():
	queue_free()


func level_up():
	level += 1
	print(level)
