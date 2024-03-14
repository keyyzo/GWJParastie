extends Node

@export var NUM_OF_ENEMIES_TO_SPAWN : int = 5


func _ready() -> void:
	for i in range(NUM_OF_ENEMIES_TO_SPAWN):
		spawn_enemy()

func spawn_enemy():
	var new_enemy = preload("res://Scenes/test_enemy.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_enemy.global_position = %PathFollow2D.global_position
	add_child(new_enemy)
