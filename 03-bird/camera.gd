extends Camera2D

@export var target : Node2D
func _physics_process(_delta: float) -> void:
	position = target.global_position * 0.1
	
