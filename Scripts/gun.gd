class_name Gun

extends Area2D

# General variables
@export var PIVOT_POINT : Marker2D

# Gun stat variables
@export var FIRE_RATE : float = 1.0
@export var SPEED_OF_BULLET : float = 5.0
@export var DAMAGE : int = 1

var can_fire : bool = true


# Bullets to load
@onready var ROCKIUM = preload("res://Scenes/rockium.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	PIVOT_POINT.look_at(get_global_mouse_position())
