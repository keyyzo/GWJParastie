class_name DashingPlayerState

extends PlayerMovementState

@export var SPEED_DEFAULT : float = 3200.0
@export var ACCELERATION_RATE : float = 200.0
@export var DECELERATION_RATE : float = 45.0
@export var FRICTION : float = 10.0
@export var DASH_COOLDOWN : float = 3.0
@export var DASH_TIMER : Timer
@export var HURTBOX : Area2D
var DASHING : bool = false


func enter(previous_state) -> void:
	DASHING = true
	PLAYER.NUMBER_OF_DASHES -= 1
	DASH_TIMER.start(PLAYER.DASH_LENGTH_TIME)
	HURTBOX.set_deferred("monitorable",false)
	
func exit() -> void:
	DASHING = false
	regain_dash()
	HURTBOX.set_deferred("monitorable",true)
	
func update(delta):
	PLAYER.update_input(SPEED_DEFAULT,ACCELERATION_RATE,DECELERATION_RATE)
	PLAYER.update_velocity()
	
	#if PLAYER.velocity.length() < 205.0:
		#transition.emit("WalkingPlayerState")
	
	
	
func regain_dash():
	await get_tree().create_timer(DASH_COOLDOWN).timeout
	PLAYER.NUMBER_OF_DASHES += 1


func _on_dash_length_timeout() -> void:
	transition.emit("WalkingPlayerState")
