extends KinematicBody2D


onready var player = get_parent().get_node("Player")
var path_to_mouse = null
export var max_speed = 200
onready var speed_randomizer = randi() % max_speed


func _ready():
	randomize()


func _process(delta):
	follow_mouse()
	move_and_slide(path_to_mouse * speed_randomizer)


func follow_mouse():
	path_to_mouse = (get_global_mouse_position() - global_position).normalized()
