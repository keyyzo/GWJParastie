class_name TestEnemyController

extends CharacterBody2D

@export var SPEED_DEFAULT : float = 200.0
@export var ACCELERATION_RATE : float = 30.0
@export var DECELERATION_RATE : float = 45.0

# Health / Damage Variables
@export var MAX_HEALTH : int = 10
@export var DAMAGE : int = 5
@export var RATE_OF_DAMAGE : float = 3.0
@export var ATTACK_TIMER : Timer
@export var HITBOX : Area2D

var current_health : int
var can_attack : bool = true

@export var AREA_OF_DETECTION : Area2D
@export var RADIUS_OF_DETECTION : CollisionShape2D
@export var RADIUS_OF_DETECTION_SIZE : float = 500.0

func _ready() -> void:
	RADIUS_OF_DETECTION.shape.radius = RADIUS_OF_DETECTION_SIZE
	current_health = MAX_HEALTH
	%EnemyHealthBar.max_value = MAX_HEALTH
	%EnemyHealthBar.value = current_health

func _physics_process(delta: float) -> void:
	pass
	
	
func update_velocity():
	move_and_slide()
	
func take_damage(damage_taken : int):
	current_health -= damage_taken
	%EnemyHealthBar.value = current_health
	
	if current_health <= 0:
		queue_free()
	

func _on_attack_timer_timeout() -> void:
	can_attack = true
	HITBOX.set_deferred("monitoring",true)


func _on_enemy_hit_box_area_entered(area: Area2D) -> void:
	if area.is_in_group("player_hurtbox"):
		if area.get_parent().has_method("take_damage"):
			if can_attack:
				print("player hit")
				area.get_parent().take_damage(DAMAGE)
				can_attack = false
				ATTACK_TIMER.start(RATE_OF_DAMAGE)
				HITBOX.set_deferred("monitoring",false)
				
	
