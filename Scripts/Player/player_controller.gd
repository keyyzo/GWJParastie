class_name PlayerController

extends CharacterBody2D

# General Player variables

@export var SPEED_DEFAULT : float = 200.0
@export var ACCELERATION_RATE : float = 30.0
@export var DECELERATION_RATE : float = 45.0
@export var FRICTION : float = 10.0

@export var ROTATION_SPEED = 0.08
var mouse_position = Vector2()

# Health and Hurtbox variables
@export var MAX_HEALTH : int = 100
@export var DAMAGE_TAKE_RATE : int = 1
@export var HURTBOX : Area2D
var current_health : int

# Dash variables to be used within the DashingPlayerState
@export var NUMBER_OF_DASHES : int = 2
@export var DASH_LENGTH_TIME : float = 0.30

# Running variables to be used within the RunningPlayerState
@export var STAMINA_POINTS : float = 100.0
@export var STAMINA_RECHARGE_RATE : float = 0.2
@export var STAMINA_USE_RATE : float = 0.5
var current_stamina = STAMINA_POINTS


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("close"):
		get_tree().quit()

func _ready() -> void:
	Global.player = self
	current_health = MAX_HEALTH
	%HealthBar.max_value = MAX_HEALTH
	%HealthBar.value = current_health

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
	
	
func take_damage(damage_taken : int):
	current_health -= damage_taken
	%HealthBar.value = current_health
	
func recharge_stamina():
	current_stamina += STAMINA_RECHARGE_RATE
	
