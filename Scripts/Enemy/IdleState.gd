class_name TestEnemyIdleState

extends TestEnemyMovementState


@export var SPEED_DEFAULT : float = 175.0
@export var ACCELERATION_RATE : float = 30.0
@export var DECELERATION_RATE : float = 45.0
@export var MIN_RAND_X_POS : float = 1.0
@export var MAX_RAND_X_POS : float = 100.0
@export var MIN_RAND_Y_POS : float = 1.0
@export var MAX_RAND_Y_POS : float = 100.0

@export var RANDOM_MOVE_TIMER : Timer

var moving_pos = false

func enter(previous_state) -> void:
	pass
	
func exit() -> void:
	moving_pos = false
	RANDOM_MOVE_TIMER.stop()

func update(delta):
	TEST_ENEMY.update_velocity()
	
	if moving_pos != true:
		RANDOM_MOVE_TIMER.start(randf_range(3.0,6.0))
		move_to_rand_pos()
	
	
func move_to_rand_pos():
	TEST_ENEMY.velocity = TEST_ENEMY.velocity.move_toward(Vector2(randf_range(MIN_RAND_X_POS,MAX_RAND_X_POS),randf_range(MIN_RAND_Y_POS,MAX_RAND_Y_POS)),SPEED_DEFAULT)
	moving_pos = true

	


func _on_random_move_timer_timeout() -> void:
	moving_pos = false

func _on_detection_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("player detected - starting chase")
		transition.emit("ChaseState")

