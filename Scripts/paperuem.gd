class_name Paperuem

extends Node2D

@export var ATTACK_RATE : float = 1.25
@export var ATTACK_DAMAGE : int = 2
@export var ATTACK_TRAVEL_SPEED : float = 1000.0
@export var ATTACK_SPEED : float = 1.0

@export var PIVOT_POINT : Node2D
@export var HITBOX : Area2D

@export var PAPERUEM_ANIMATION_PLAYER : AnimationPlayer

var can_attack : bool = true
var is_travelling : bool = false
var temp_click_pos : Vector2
var target_destination_reached : bool = false

@onready var NEW_INSTANCE = load("res://Scenes/paperuem.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	PIVOT_POINT.look_at(get_global_mouse_position())

	if Input.is_action_just_pressed("use_button") and can_attack:
		if is_travelling != true:
			temp_click_pos = Vector2(get_global_mouse_position().x - 90.0,get_global_mouse_position().y)
			is_travelling = true
			
	travel_to_attack_point(temp_click_pos,delta)
func aoe_attack():
	pass
	
func travel_to_attack_point(attack_pos:Vector2, delta:float):
	if is_travelling:
		global_position = global_position.move_toward(attack_pos,ATTACK_TRAVEL_SPEED * delta)
	if global_position == attack_pos:
		is_travelling = false
		
func spawn_new_paperuem():
	get_parent().add_child(NEW_INSTANCE.instantiate())
