class_name RunningPlayerState

extends PlayerMovementState

@export var SPEED_DEFAULT : float = 400.0
@export var ACCELERATION_RATE : float = 30.0
@export var DECELERATION_RATE : float = 45.0
@export var FRICTION : float = 10.0


func enter(previous_state) -> void:
	pass
	
func exit() -> void:
	pass
	
func update(delta):
	PLAYER.update_input(SPEED_DEFAULT,ACCELERATION_RATE,DECELERATION_RATE)
	PLAYER.update_velocity()

	if Input.is_action_just_released("run") or PLAYER.current_stamina <= 0:
		transition.emit("WalkingPlayerState")
	
	if Input.is_action_just_pressed("dash") and PLAYER.NUMBER_OF_DASHES > 0:
		transition.emit("DashingPlayerState")
	
	if PLAYER.velocity.length() == 0.0:
		transition.emit("IdlePlayerState")
		
	PLAYER.current_stamina -= PLAYER.STAMINA_USE_RATE
	
		

