extends CharacterBody2D

signal jumped

const SPEED = 150
const JUMP_VELOCITY = -250

var jump_turn = null
var jump_times = 0


func _physics_process(delta: float) -> void:


	if not is_on_floor():
		velocity += get_gravity() * delta


	if is_on_floor():
		jump_times = 0


	if jump_times < 2:
		if Input.is_action_just_pressed("w") and is_on_floor():
			if jump_turn != false:
				jump_turn = false
				jump_times += 1
				jumped.emit()
				velocity.y = JUMP_VELOCITY
		elif Input.is_action_just_pressed("w"):
			if jump_turn != false:
				jump_turn = false
				jump_times += 2
				jumped.emit()
				velocity.y = JUMP_VELOCITY
				
				
	var direction := Input.get_axis("a", "d")
	if direction:
		velocity.x = direction * SPEED
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	elif velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
	
	move_and_slide()


func _on_p_2_jumped() -> void:
	jump_turn = true
	
func spawn(pos):
	position = pos
