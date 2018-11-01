extends Node

var character_path = preload("res://Player/Character.tscn")
var current_state_instance = null
var character_node = null

func _ready():
	#Creating instance of character in order to start the FSM
	character_node = character_path.instance()
	add_child(character_node)
	#Creating the iniital state
	current_state_instance = character_node.idle_state_path.new()
	#Connnecting first state
	current_state_instance.connect("changing_state", self, "on_changing_state")
	#Getting started the first state
	current_state_instance.enter(character_node)

func _process(delta):
	current_state_instance.update(delta)

func on_changing_state(state):
#	print("entrando a changing state")
	if ( state != null):
		current_state_instance.exit()
		current_state_instance.queue_free()	
		current_state_instance = state
		#Reconnecting the last created state
		current_state_instance.connect("changing_state", self, "on_changing_state")
		current_state_instance.enter(character_node)
#	