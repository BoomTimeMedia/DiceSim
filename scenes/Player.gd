extends CharacterBody2D

@export var speed = 200
@export var friction = 0.1
@export var acceleration = 0.1

func _physics_process(delta: float) -> void:
	var input_vector := Vector2(
		Input.get_axis("move_left", "move_right"),
		Input.get_axis("move_up", "move_down")
	)
	if input_vector.length() > 0:
		velocity = velocity.lerp(input_vector.normalized() * speed, acceleration)
	else:
		velocity = velocity.lerp(Vector2.ZERO, friction)
	move_and_slide()
