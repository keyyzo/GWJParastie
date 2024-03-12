class_name TestEnemyMovementState

extends State

var TEST_ENEMY : TestEnemyController


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await owner.ready
	TEST_ENEMY = owner as TestEnemyController

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
