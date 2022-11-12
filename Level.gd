extends Node2D


export(PackedScene) var sheep_scene


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_SheepTimer_timeout():
	var sheep = sheep_scene.instance()
	var sheep_spawn_location = get_node("MobPath/PathFollow2D")
	sheep_spawn_location.offset = randi()
	sheep.position = sheep_spawn_location.position
	add_child(sheep)
