class_name Scissorium

extends Node2D

@export var ATTACK_RATE : float = 1.25
@export var ATTACK_DAMAGE : int = 2
@export var PIVOT_POINT : Node2D
@export var HITBOX : Area2D

@export var SCISSORIUM_ANIMATION_PLAYER : AnimationPlayer

var can_attack : bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	PIVOT_POINT.look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("use_button") and can_attack:
		can_attack = false
		SCISSORIUM_ANIMATION_PLAYER.play("Attack")
		
	var check_monitoring = HITBOX.is_monitoring()
	print(check_monitoring)
		
func attack():
	pass


func _on_scissorium_animations_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Attack":
		can_attack = true


func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("test_enemy"):
		print("enemy hit")
		if body.has_method("take_damage"):
			body.take_damage(ATTACK_DAMAGE)
