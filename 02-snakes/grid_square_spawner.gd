extends Node2D

@export var cellswide : int = 6
@export var cellshigh : int = 3
@export var cellwidth : float = 30
@export var cellheight : float = 30
@export var gridsquareprefab : PackedScene

func _ready() -> void:
	var id : int = 1
	var goingleft : bool = true
	var pos : Vector2 = Vector2.ZERO
	for y in range(cellshigh):
		for x in range(cellswide):
			if x != 0:
				pos.x += (-1 if goingleft else 1) * cellwidth
			make_grid_square(pos, id)
			id += 1
		goingleft = !goingleft
		pos.y -= cellheight
	
func make_grid_square(pos:Vector2, id:int):
	var gridsquare = gridsquareprefab.instantiate()
	gridsquare.position = pos
	gridsquare.get_node("Label").text = str(id)
	add_child(gridsquare)
