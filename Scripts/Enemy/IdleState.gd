class_name TestEnemyIdleState

extends TestEnemyMovementState

# General variables
@export var SPEED_DEFAULT : float = 200.0
@export var ACCELERATION_RATE : float = 30.0
@export var DECELERATION_RATE : float = 45.0

# Variables for idle state - designed for roaming around the map
@export var PATROL_RANGE : float = 500.0
@export var RANDOM_MOVE_TIMER : Timer

var moving_pos = false
var origin_position : Vector2 = Vector2.ZERO
var patrol_location : Vector2 = Vector2.ZERO

func enter(previous_state) -> void:
	origin_position = TEST_ENEMY.global_position
	
func exit() -> void:
	moving_pos = false
	RANDOM_MOVE_TIMER.stop()

func update(delta):
	
	
	if moving_pos != true:
		randomize_positions()
		RANDOM_MOVE_TIMER.start(randf_range(2.0,10.0))
		moving_pos = true
	
	if RANDOM_MOVE_TIMER.time_left > 0.0 and TEST_ENEMY.global_position.distance_to(patrol_location) > 1.0:
		move_to_rand_pos()
	else:
		RANDOM_MOVE_TIMER.stop()
		moving_pos = false
		
	TEST_ENEMY.update_velocity()
	
	
func move_to_rand_pos():
		
		
		var direction := TEST_ENEMY.global_position.direction_to(patrol_location)
	
		TEST_ENEMY.velocity += direction * ACCELERATION_RATE
		
		TEST_ENEMY.velocity = TEST_ENEMY.velocity.limit_length(SPEED_DEFAULT)


	


func _on_random_move_timer_timeout() -> void:
	origin_position = TEST_ENEMY.global_position
	moving_pos = false

func _on_detection_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("player detected - starting chase")
		transition.emit("ChaseState")
		
func randomize_positions():
	var random_x = randf_range(-PATROL_RANGE,PATROL_RANGE)
	var random_y = randf_range(-PATROL_RANGE,PATROL_RANGE)
	patrol_location = Vector2(random_x,random_y) + origin_position

