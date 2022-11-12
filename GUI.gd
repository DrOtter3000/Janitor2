extends Control


func update_lifepoints(lifepoints, lifepoints_max):
	$Lifebar.max_value = lifepoints_max
	$Lifebar.value = lifepoints
