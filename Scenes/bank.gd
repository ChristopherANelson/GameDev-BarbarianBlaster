extends MarginContainer

@export var starting_gold : = 150
@onready var label: Label = $Label
@onready var time_left: Label = $TimeLeft
@onready var difficulty_manager: Node = $"../DifficultyManager"


var gold: int:
	set(gold_in):
		gold = max(gold_in, 0)
		label.text = "GOLD: " + str(gold)
		
		
func _ready() -> void:
	gold = starting_gold

func _process(delta: float) -> void:
	var seconds_left = difficulty_manager.game_time_left()
	time_left.text = "Time: " + str(seconds_left) + " s"
	print(seconds_left)
