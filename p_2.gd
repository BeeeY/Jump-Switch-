extends CharacterBody2D

signal jumped

const SPEED = 300.0
const JUMP_VELOCITY = -500.0

var jump_turn = null
var jump_times = 0


func _physics_process(delta: float) -> void:


	if not is_on_floor():
		velocity += get_gravity() * delta


	if is_on_floor():
		jump_times = 0


	if jump_times < 2:
		if Input.is_action_just_pressed("up") and is_on_floor():
			if jump_turn != false:
				jump_turn = false
				jump_times += 1
				jumped.emit()
				velocity.y = JUMP_VELOCITY
		elif Input.is_action_just_pressed("up"):
			if jump_turn != false:
				jump_turn = false
				jump_times += 2
				jumped.emit()
				velocity.y = JUMP_VELOCITY
				

	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)


	move_and_slide()


func _on_p_1_jumped() -> void:
	jump_turn = true
