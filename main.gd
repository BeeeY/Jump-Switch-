extends Node2D

signal level_finished

var p1_on_flag = false
var p2_on_flag = false
var level = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Level2.collision_enabled = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if p1_on_flag && p2_on_flag:
		print("osehfieljflj")
		level += 1
		restart()
		level_finished.emit()

func _on_hud_start_game() -> void:
	$P1.spawn($Spawn1.position)
	$P2.spawn($Spawn2.position)
	

func next_level(current_level,next_level):
	current_level.hide()
	current_level.collision_enabled = false
	next_level.show()
	next_level.collision_enabled = true


func restart():
	p1_on_flag = false
	p2_on_flag = false
	
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		restart()

func _on_red_flag_body_entered(body: Node2D) -> void:
	if body.is_in_group("red"):
		p1_on_flag = true

func _on_blue_flag_body_entered(body: Node2D) -> void:
	if body.is_in_group("blue"):
		p2_on_flag = true

func _on_red_flag_body_exited(body: Node2D) -> void:
	if body.is_in_group("red"):
		p1_on_flag = false

func _on_blue_flag_body_exited(body: Node2D) -> void:
	if body.is_in_group("blue"):
		p2_on_flag = false
