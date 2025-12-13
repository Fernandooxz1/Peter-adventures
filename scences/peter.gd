extends CharacterBody2D

@export var speed = 120.0

func _physics_process(_delta):
	var walk = Input.get_vector("left", "right", "up", "down")
	var isRuning = Input.is_action_pressed("run")
	
	if walk:
		if isRuning:
			velocity = walk * (speed * 1.5) 
			$AnimatedSprite2D.play("run")
		else:
			velocity = walk * speed 
			$AnimatedSprite2D.play("walk")
		if walk.x != 0:
			$AnimatedSprite2D.flip_h = walk.x > 0
	else:
		velocity = Vector2.ZERO
		$AnimatedSprite2D.play("idle")

	move_and_slide()
