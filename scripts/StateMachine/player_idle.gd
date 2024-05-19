extends State
class_name PlayerIdle

@onready var animated_sprite_2d : AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var label : Label = $"../../Control/Label"
@onready var player : CharacterBody2D = $"../.."

var direcao : Vector2

func Enter():
	animated_sprite_2d.play("idle")

func Exit():
	pass

func Update(_delta:float):
	label.text = self.name + " \n " + str(player.global_position)
	direcao = Input.get_vector("left", "right", "up", "down").normalized()
	if direcao != Vector2.ZERO:
		state_transition.emit(self, "PlayerMovement")
