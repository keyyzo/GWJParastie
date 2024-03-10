class_name IdlePlayerState

extends PlayerMovementState

@export var SPEED_DEFAULT : float = 400.0
@export var ACCELERATION_RATE : float = 40.0
@export var DECELERATION_RATE : float = 60.0
@export var FRICTION : float = 10.0


func enter(previous_state) -> void:
	pass
	
func exit() -> void:
	pass
	
func update(delta):
	PLAYER.update_input(SPEED_DEFAULT,ACCELERATION_RATE,DECELERATION_RATE)
	PLAYER.update_velocity()

	if PLAYER.velocity.length() > 0.0:
		transition.emit("WalkingPlayerState")
