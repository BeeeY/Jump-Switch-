extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_hud_start_game() -> void:
	pass # Replace with function body.


func next_level(current_level,next_level):
	current_level.hide()
	current_level.collision_enabled = false
	next_level.show()
	next_level.collision_enabled = true
