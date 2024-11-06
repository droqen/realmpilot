extends Node2D

@export var posmult : float = 2

func _physics_process(_delta: float) -> void:
	position = get_parent().position*-posmult
