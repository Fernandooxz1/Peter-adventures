extends CharacterBody2D

@export var speed = 200.0

func _ready():
	# Esto nos dirá si el script al menos se está ejecutando al inicio
	print(">>> EL SCRIPT DE PETER ESTÁ ACTIVO <<<")

func _physics_process(_delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	
	# Esto imprimirá la dirección en la consola inferior todo el tiempo
	# Si presionas teclas y esto sigue diciendo (0, 0), el problema es el Mapa de Entrada
	print("Dirección actual: ", direction)
	
	if direction:
		velocity = direction * speed
	else:
		velocity = Vector2.ZERO

	move_and_slide()
