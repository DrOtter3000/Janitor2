extends Control


func _ready():
	pass


func _on_BtnStart_pressed():
	get_tree().change_scene("res://Level.tscn")


func _on_BtnExplain_pressed():
	pass # Replace with function body.


func _on_BtnCredits_pressed():
	pass # Replace with function body.


func _on_BtnQuit_pressed():
	get_tree().quit()
