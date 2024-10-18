extends Node3D

@export var turrent: PackedScene

@export var enemy_path: Path3D
	
	
func build_turrent(turrent_position: Vector3) -> void:
	var new_turrent = turrent.instantiate()
	add_child(new_turrent)
	new_turrent.global_position = turrent_position
	new_turrent.enemy_path = enemy_path
	
