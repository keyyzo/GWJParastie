class_name Gun

extends Area2D

# General variables
@export var PIVOT_POINT : Marker2D
@export var SHOOTING_POINT : Marker2D

# Rockium stat variables
@export var ROCKIUM_FIRE_RATE : float = 1.0
@export var SPEED_OF_BULLET : float = 5.0
@export var ROCKIUM_DAMAGE : int = 1

var can_fire : bool = true
@export var BULLET_TIMER : Timer

# Bullets to load
@onready var ROCKIUM = preload("res://Scenes/rockium.tscn")
@onready var SCISSORIUM = preload("res://Scenes/scissorium.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	PIVOT_POINT.look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("use_button") and can_fire:
		shoot()
		can_fire = false
		
	
func shoot():
	var bullet = ROCKIUM.instantiate()
	bullet.position = SHOOTING_POINT.global_position
	bullet.rotation = PIVOT_POINT.rotation
	get_tree().get_root().add_child(bullet)
	bullet.bullet_fired(SPEED_OF_BULLET,ROCKIUM_DAMAGE)
	BULLET_TIMER.start(ROCKIUM_FIRE_RATE)
	
func melee():
	pass
	
func area_of_effect():
	pass


func _on_timer_timeout() -> void:
	can_fire = true
