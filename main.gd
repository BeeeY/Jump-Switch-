extends Node2D

signal level_finished
signal game_finish

@onready var p1_spawn = $Spawn1.position
@onready var p2_spawn = $Spawn2.position
var p1_on_flag = false
var p2_on_flag = false
var p1_and_p2_were_on_flags = false
var level = 1
@onready var levels = [
$Level1,
$Level2,
$Level3,
$Level4,
$Level5,
$Level6,
$Level7,
$Level8,
$Level9,
$Level10]
@onready var s1 = $Spawn1.position
@onready var s2 = $Spawn2.position
@onready var s3 = $Spawn3.position
@onready var s4 = $Spawn4.position

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for level in levels:
		level.collision_enabled = false
	$Level1.collision_enabled = true
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_hud_start_game() -> void:
	$P1.spawn($Spawn1.position)
	$P2.spawn($Spawn2.position)
	

func next_level(current_level,next_level):
	current_level.hide()
	current_level.collision_enabled = false
	next_level.show()
	next_level.collision_enabled = true

func move_flags_and_players(p1_new_pos,p2_new_pos,redflag_new_pos,blueflag_new_pos):
		$P1.spawn(p1_new_pos)
		$P2.spawn(p2_new_pos)
		$RedFlag.position = redflag_new_pos
		$BlueFlag.position = blueflag_new_pos

func restart():
	
	$P1.jump_turn = null
	$P2.jump_turn = null
	$P1.velocity = Vector2.ZERO
	$P2.velocity = Vector2.ZERO
	$hud.style.border_color = Color.GRAY
	
	if p1_on_flag == true && p2_on_flag == true:
		p1_and_p2_were_on_flags = true
		
	p1_on_flag = false
	p2_on_flag = false
	
	if level == 1:
		if p1_and_p2_were_on_flags == true:
			next_level($Level1,$Level2)
			move_flags_and_players(s4,s1,s3,s2)
			$Controls.hide()
			$Controls2.hide()
		else:
			move_flags_and_players(s1,s2,s2,s1)
			
	elif level == 2:
		if p1_and_p2_were_on_flags == true:
			next_level($Level2,$Level3)
			move_flags_and_players(s1,s4,s2,s3)
		else:
			move_flags_and_players(s4,s1,s3,s2)
			
	elif level == 3:
		if p1_and_p2_were_on_flags == true:
			next_level($Level3,$Level4)
			move_flags_and_players(s1,s4,s2,s3) #wrong
		else:
			move_flags_and_players(s1,s4,s2,s3)
			
	elif level == 4:
		if p1_and_p2_were_on_flags == true:
			next_level($Level4,$Level5)
			$P1.spawn(p1_spawn)
			$P2.spawn(p2_spawn)
		else:
			$P1.spawn(p1_spawn)
			$P2.spawn(p2_spawn)
	elif level == 5:
		if p1_and_p2_were_on_flags == true:
			next_level($Level5,$Level6)
			$P1.spawn(p1_spawn)
			$P2.spawn(p2_spawn)
		else:
			$P1.spawn(p1_spawn)
			$P2.spawn(p2_spawn)
	elif level == 6:
		if p1_and_p2_were_on_flags == true:
			next_level($Level6,$Level7)
			$P1.spawn(p1_spawn)
			$P2.spawn(p2_spawn)
		else:
			$P1.spawn(p1_spawn)
			$P2.spawn(p2_spawn)
	elif level == 7:
		if p1_and_p2_were_on_flags == true:
			next_level($Level7,$Level8)
			$P1.spawn(p1_spawn)
			$P2.spawn(p2_spawn)
		else:
			$P1.spawn(p1_spawn)
			$P2.spawn(p2_spawn)
	elif level == 8:
		if p1_and_p2_were_on_flags == true:
			next_level($Level8,$Level9)
			$P1.spawn(p1_spawn)
			$P2.spawn(p2_spawn)
		else:
			$P1.spawn(p1_spawn)
			$P2.spawn(p2_spawn)
	elif level == 9:
		if p1_and_p2_were_on_flags == true:
			next_level($Level9,$Level10)
			$P1.spawn(p1_spawn)
			$P2.spawn(p2_spawn)
		else:
			$P1.spawn(p1_spawn)
			$P2.spawn(p2_spawn)
	elif level == 10:
		if p1_and_p2_were_on_flags == true:
			game_finish.emit()
		else:
			$P1.spawn(p1_spawn)
			$P2.spawn(p2_spawn)
	p1_and_p2_were_on_flags = false
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		restart()

func _on_red_flag_body_entered(body: Node2D) -> void:
	if body.is_in_group("red"):
		p1_on_flag = true
		if p2_on_flag == true:
			level_finished.emit()

func _on_blue_flag_body_entered(body: Node2D) -> void:
	if body.is_in_group("blue"):
		p2_on_flag = true
		if p1_on_flag == true:
			level_finished.emit()

func _on_red_flag_body_exited(body: Node2D) -> void:
	if body.is_in_group("red"):
		p1_on_flag = false

func _on_blue_flag_body_exited(body: Node2D) -> void:
	if body.is_in_group("blue"):
		p2_on_flag = false

func _on_level_finished() -> void:
	restart()
	level += 1
