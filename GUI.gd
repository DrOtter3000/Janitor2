extends CanvasLayer


func update_lifepoints(lifepoints, lifepoints_max):
	$Control/HBoxContainer/Lifebar.max_value = lifepoints_max
	$Control/HBoxContainer/Lifebar.value = lifepoints


func update_level(xp, xp_max):
	$Control/HBoxContainer/Levelbar.max_value = xp_max
	$Control/HBoxContainer/Levelbar.value = xp
