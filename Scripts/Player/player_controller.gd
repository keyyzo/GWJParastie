class_name PlayerController

extends CharacterBody2D

# General Player variables

@export var SPEED_DEFAULT : float = 400.0
@export var ACCELERATION_RATE : float = 40.0
@export var DECELERATION_RATE : float = 60.0
@export var FRICTION : float = 10.0

@export var ROTATION_SPEED = 0.08
var mouse_position = Vector2()

func _ready() -> void:
	Global.player = self

func _physics_process(delta: float) -> void:
	pass

func update_input(_speed : float, _acceleration : float, _deceleration : float) -> void:
	var input_vector = Vector2(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
							Input.get_action_strength("move_down") - Input.get_action_strength("move_up"))
	
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity += input_vector * _acceleration
		velocity = velocity.limit_length(_speed)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, _deceleration)
	
func update_velocity() -> void:
	move_and_slide()
