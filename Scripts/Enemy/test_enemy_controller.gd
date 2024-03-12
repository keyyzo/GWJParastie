class_name TestEnemyController

extends CharacterBody2D

@export var SPEED_DEFAULT : float = 200.0
@export var ACCELERATION_RATE : float = 30.0
@export var DECELERATION_RATE : float = 45.0

@export var HEALTH : int = 20
@export var DAMAGE : int = 5

@export var AREA_OF_DETECTION : Area2D
@export var RADIUS_OF_DETECTION : CollisionShape2D
@export var RADIUS_OF_DETECTION_SIZE : float = 500.0

func _ready() -> void:
	RADIUS_OF_DETECTION.shape.radius = RADIUS_OF_DETECTION_SIZE

func _physics_process(delta: float) -> void:
	pass

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := global_position.direction_to(Global.player.global_position)
	#if direction:
		#velocity += direction * ACCELERATION_RATE
		#
		#velocity = velocity.limit_length(SPEED_DEFAULT)
	#else:
		#velocity = velocity.move_toward(Vector2.ZERO, DECELERATION_RATE)
#
	#move_and_slide()
	
	
func update_velocity():
	move_and_slide()
