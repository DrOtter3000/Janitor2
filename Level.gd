extends Node2D


export(PackedScene) var sheep_scene
export(PackedScene) var bee_scene
export var bee_number = 5


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	spawn_bunch_of_bees()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func spawn_bunch_of_bees():
	for i in range(bee_number):
		spawn_bee()


func spawn_bee():
	var bee = bee_scene.instance()
	var bee_spawn_location = get_node("MobPath/PathFollow2D")
	bee_spawn_location.offset = randi()
	bee.position = bee_spawn_location.position
	add_child(bee)


func _on_SheepTimer_timeout():
	var sheep = sheep_scene.instance()
	var sheep_spawn_location = get_node("MobPath/PathFollow2D")
	sheep_spawn_location.offset = randi()
	sheep.position = sheep_spawn_location.position
	add_child(sheep)
