class_name TestEnemyChaseState

extends TestEnemyMovementState

@export var SPEED_DEFAULT : float = 250.0
@export var ACCELERATION_RATE : float = 30.0
@export var DECELERATION_RATE : float = 45.0


func enter(previous_state) -> void:
	pass
	
func exit() -> void:
	pass

func update(delta):
	
	chase()
	TEST_ENEMY.update_velocity()
	
	
	
func chase():
	
	var direction = TEST_ENEMY.global_position.direction_to(Global.player.global_position)
	if direction:
		TEST_ENEMY.velocity += direction * ACCELERATION_RATE
		
		TEST_ENEMY.velocity = TEST_ENEMY.velocity.limit_length(SPEED_DEFAULT)
	else:
		TEST_ENEMY.velocity = TEST_ENEMY.velocity.move_toward(Vector2.ZERO, DECELERATION_RATE)
	



func _on_detection_area_body_exited(body: Node2D) -> void:
	pass
	#print("player out of reach - going to search")
	#transition.emit("IdleState")
