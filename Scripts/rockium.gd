class_name Rockium

extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	queue_free()
	
func bullet_fired(bullet_speed:float, bullet_damage:float):
	pass


func _on_body_entered(body: Node) -> void:
	pass # Replace with function body.