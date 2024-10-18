extends PathFollow3D

@export var speed: float = 7
@export var max_health: int = 5
@export var gold_value := 15

@onready var bank = get_tree().get_first_node_in_group("bank")

var current_health: int:
	set(health_in):
		if health_in < current_health:
			animation_player.play("TakeDamage")
		current_health = health_in
		if current_health < 1:
			queue_free()
			bank.gold += gold_value

@onready var base = get_tree().get_first_node_in_group("base")
@onready var animation_player: AnimationPlayer = $AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_health = max_health
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		progress = progress + speed * delta
		if progress_ratio == 1.0:
			base.take_damage()
			set_process(false)
			queue_free()
