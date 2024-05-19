extends State
class_name PlayerMovement

@onready var animated_sprite_2d : AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var label : Label = $"../../Control/Label"
@onready var player = $"../.."

var direcao : Vector2
var velocidade : float = 10

func Enter():
	animated_sprite_2d.play("moving")


func Exit():
	pass

func Update(_delta:float):
	label.text = self.name + " \n " + str(player.global_position) + " \n " + str(direcao)

func Physics_Update(delta: float) -> void:
	player_movement(delta)

func player_movement(delta : float) -> void:
	direcao = Input.get_vector("left", "right", "up", "down").normalized()
	
	if direcao.x < 0:
		animated_sprite_2d.flip_h = true
	if direcao.x > 0:
		animated_sprite_2d.flip_h = false
	
	if direcao != Vector2.ZERO:
		player.velocity = direcao * velocidade * delta
	if direcao == Vector2.ZERO:
		player.velocity = Vector2.ZERO
	

	player.move_and_slide()
	
	if direcao == Vector2.ZERO:
		state_transition.emit(self, "PlayerIdle")
