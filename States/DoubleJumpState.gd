extends "res://States/StateBase.gd"

var character_node = null

func enter(character_node):
	print("Enter function DoubleJump")
	self.character_node = character_node
	character_node.jump()
	
func update(delta):
#Touch floor
	if character_node.touch_floor : 
		emit_signal("changing_state", character_node.idle_state_path.new() ) 
	
func exit():
#	pass
	print("Exit function DoubleJump")
