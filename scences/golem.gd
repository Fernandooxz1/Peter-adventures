extends CharacterBody2D

@export var speed = 80.0 
@export var damage = 10

enum State { IDLE, CHASE, ATTACK }
var current_state = State.IDLE

var player = null

@onready var sprite = $AnimatedSprite2D

func _physics_process(_delta):
	match current_state:
		State.IDLE:
			velocity = Vector2.ZERO
			sprite.play("idle")
			
		State.CHASE:
			if player:
				var direction = (player.global_position - global_position).normalized()
				velocity = direction * speed
				sprite.play("roll")
				
				if direction.x != 0:
					sprite.flip_h = direction.x < 0
			else:
				current_state = State.IDLE
				
		State.ATTACK:
			velocity = Vector2.ZERO
		
			
	move_and_slide()

func _on_animated_sprite_2d_animation_finished():
	if sprite.animation == "attack":
		if player:
			current_state = State.CHASE
		else:
			current_state = State.IDLE

func _on_area_detection_body_entered(body):
	if body.name == "Peter":
		player = body
		current_state = State.CHASE
		sprite.play("walk")


func _on_area_detection_body_exited(body):
	if body == player:
		player = null
		current_state = State.IDLE


func _on_area_attack_body_entered(body):
	if body == player and current_state != State.ATTACK:
		current_state = State.ATTACK
		sprite.play("roll")	
