extends Node2D

@onready var battle = $Battle
@onready var hud = $CanvasLayer/HUD

func _ready():
    print("Medieval PvP iniciado!")

func start_game():
    battle.start_battle()
