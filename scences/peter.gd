extends CharacterBody2D

@export var speed = 200.0 

func _physics_process(_delta: float) -> void:
	# 1. OBTENER DIRECCIÓN (Input)
	
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if direction:
		velocity = direction * speed
	else:
		# velocity.x y velocity.y se ponen a 0, FRENAMOS
		velocity = Vector2.ZERO

	# 2. MOVER
	move_and_slide()
