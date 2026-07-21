extends CharacterBody2D

@export var max_hp := 100
@export var hp := 100

@export var max_mana := 50
@export var mana := 50

@export var attack := 15
@export var defense := 8

@onready var sprite = $AnimatedSprite2D
@onready var animation = $AnimationPlayer

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

    animation.play("hurt")

    if hp <= 0:
        hp = 0
        animation.play("death")
