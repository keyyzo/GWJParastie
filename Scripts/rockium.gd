class_name Rockium

extends RigidBody2D


var damage_to_deal : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	pass

	
func _on_timer_timeout() -> void:
	queue_free()
	
func bullet_fired(bullet_speed:float, bullet_damage:int):
	apply_impulse(Vector2(bullet_speed, 0).rotated(rotation))
	damage_to_deal = bullet_damage


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("normal_wall"):
		queue_free()
	elif body.is_in_group("test_enemy"):
		print("enemy hit")
		if body.has_method("take_damage"):
			body.take_damage(damage_to_deal)
			queue_free()
	
		

