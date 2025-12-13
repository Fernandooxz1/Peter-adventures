extends CharacterBody2D

@export var SPEED = 100.0
@onready var sprite = $AnimatedSprite2D
func _physics_process(_delta):
	var walk = Input.get_vector("left", "right", "up", "down")
	var isRuning = Input.is_action_pressed("run")
	
	if walk:
		if isRuning:
			velocity = walk * (SPEED * 1.5) 
			sprite.play("run")
		else:
			velocity = walk * SPEED
			sprite.play("walk")
		if walk.x != 0:
			sprite.flip_h = walk.x > 0
	else:
		velocity = Vector2.ZERO
		sprite.play("idle")

	move_and_slide()
