class_name Paperuem

extends Node2D

@export var ATTACK_RATE : float = 1.25
@export var ATTACK_DAMAGE : int = 2
@export var ATTACK_TRAVEL_SPEED : float = 1000.0
@export var ATTACK_SPEED : float = 1.0

@export var PIVOT_POINT : Node2D
@export var HITBOX : Area2D

@export var PAPERUEM_ANIMATION_PLAYER : AnimationPlayer

var can_attack : bool = true
var is_travelling : bool = false
var temp_click_pos : Vector2
var target_destination_reached : bool = false
var aoe_active : bool = false

@onready var NEW_INSTANCE = load("res://Scenes/paperuem.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	can_attack = true
	is_travelling = false
	target_destination_reached = false
	temp_click_pos = Vector2.ZERO

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	if not is_travelling:
		PIVOT_POINT.look_at(get_global_mouse_position())
	if can_attack:
		if Input.is_action_just_pressed("use_button"):
			if is_travelling != true:
				#temp_click_pos = Vector2(get_global_mouse_position().x - 90.0,get_global_mouse_position().y)
				temp_click_pos = Vector2(get_global_mouse_position().x,get_global_mouse_position().y)
				
				if temp_click_pos.x < 0 and temp_click_pos.y > 0:
					temp_click_pos = Vector2(temp_click_pos.x + 45.0, temp_click_pos.y - 45.0)
				elif temp_click_pos.x > 0 and temp_click_pos.y > 0:
					temp_click_pos = Vector2(temp_click_pos.x - 45.0, temp_click_pos.y - 45.0)
				elif temp_click_pos.x > 0 and temp_click_pos.y < 0:
					temp_click_pos = Vector2(temp_click_pos.x - 45.0, temp_click_pos.y + 45.0)
				elif temp_click_pos.x < 0 and temp_click_pos.y < 0:
					temp_click_pos = Vector2(temp_click_pos.x + 45.0, temp_click_pos.y + 45.0)
				
				is_travelling = true
			
	travel_to_attack_point(temp_click_pos,delta)
func aoe_attack():
	pass
	
func aiming_paperuem():
	PIVOT_POINT.look_at(get_global_mouse_position())
	
func fire_paperuem():
	if Input.is_action_just_pressed("use_button"):
			if is_travelling != true:
				#temp_click_pos = Vector2(get_global_mouse_position().x - 90.0,get_global_mouse_position().y)
				temp_click_pos = Vector2(get_global_mouse_position().x,get_global_mouse_position().y)
				if temp_click_pos.x < 0 and temp_click_pos.y > 0:
					temp_click_pos = Vector2(temp_click_pos.x + 45.0, temp_click_pos.y - 45.0)
				elif temp_click_pos.x > 0 and temp_click_pos.y > 0:
					temp_click_pos = Vector2(temp_click_pos.x - 45.0, temp_click_pos.y - 45.0)
				elif temp_click_pos.x > 0 and temp_click_pos.y < 0:
					temp_click_pos = Vector2(temp_click_pos.x - 45.0, temp_click_pos.y + 45.0)
				elif temp_click_pos.x < 0 and temp_click_pos.y < 0:
					temp_click_pos = Vector2(temp_click_pos.x + 45.0, temp_click_pos.y + 45.0)
				
					
				is_travelling = true
	
func travel_to_attack_point(attack_pos:Vector2, delta:float):
	if is_travelling:
		reparent(get_tree().get_root(),true)
		global_position = global_position.move_toward(attack_pos,ATTACK_TRAVEL_SPEED * delta)
		if global_position == attack_pos:
			target_destination_reached = true
			can_attack = false
			PAPERUEM_ANIMATION_PLAYER.play("Attack")
		
func spawn_new_paperuem():
	Global.player.add_child(NEW_INSTANCE.instantiate())
	



func _on_paperuem_animations_animation_finished(anim_name: StringName) -> void:
	
	spawn_new_paperuem()
	queue_free()
	
