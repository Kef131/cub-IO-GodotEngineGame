extends "res://States/StateBase.gd"

var character_node = null

func enter(character_node):
	print("Enter function JUMP")
	self.character_node = character_node
	character_node.jump()
	
func update(delta):

#Touch floor
	if (character_node.touch_floor):
		emit_signal("changing_state", character_node.idle_state_path.new()) 
	
#DoubleJump State

	elif Input.is_action_just_pressed("ui_jump"):
		emit_signal("changing_state",  character_node.double_jump_state_path.new() ) 

func exit():
	pass
#	print("Exit function JUMP")