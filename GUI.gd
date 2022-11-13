extends Control


func update_lifepoints(lifepoints, lifepoints_max):
	$Lifebar.max_value = lifepoints_max
	$Lifebar.value = lifepoints


func update_level(xp, xp_max):
	$Levelbar.max_value = xp_max
	$Levelbar.value = xp
