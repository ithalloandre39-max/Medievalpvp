extends CharacterBody2D

@export var max_hp := 80
@export var hp := 80

@export var attack := 12
@export var defense := 5

@onready var sprite = $AnimatedSprite2D

func _ready():
    sprite.play("idle")

func attack_target(target):

    sprite.play("attack")

    await sprite.animation_finished

    target.take_damage(attack)

    sprite.play("idle")

func take_damage(value):

    var damage = max(1, value - defense)

    hp -= damage

    sprite.play("hurt")

    await sprite.animation_finished

    if hp <= 0:
        hp = 0
        sprite.play("death")
    else:
        sprite.play("idle")
