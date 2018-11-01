extends Node

var idle_state_class = preload("res://IdleState.gd")
var character_path = preload("res://Player/Character.tscn")
#Manejar los estados dentro del diagrama de Maquina de Estados
#Asegurar de ejecutar los tres estados de cada maquina de estados
var current_state_instance = null
var character_node = null

func _ready():
	current_state_instance = idle_state_class.new()
	idle_state_class.connect("changing_state", self, "on_changing_state")
	character_node = character_path.instance()
	add_child(character_node)

	current_state_instance.enter(character_node)

func _process(delta):
	current_state_instance.update(delta)

func on_changing_state(state):
	current_state_instance.exit()
	current_state_instance.free_queued()
	current_state_instance = state
	current_state_instance.enter(character_node)
	