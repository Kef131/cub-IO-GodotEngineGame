extends "res://States/StateBase.gd"

var character_node = null

func enter(character_node):
	print("Enter function TURNING")
	self.character_node = 	character_node
	if (Vector3(0,0,1).dot(character_node.dir) < 0)||(Vector3(0,0,-1).dot(character_node.dir) < 0)||(Vector3(1,0,0).dot(character_node.dir) < 0)||(Vector3(-1,0,0).dot(character_node.dir) < 0):
		character_node.turn(deg2rad(180))
	
func update(delta):
	
	if (Vector3(0,0,1).dot(character_node.dir) > 0)||(Vector3(0,0,-1).dot(character_node.dir) > 0)||(Vector3(1,0,0).dot(character_node.dir) > 0)||(Vector3(-1,0,0).dot(character_node.dir) > 0):
		emit_signal("changing_state", character_node.moving_state_path.new() ) 
		
		
#Jump State
	if Input.is_action_pressed("ui_jump"):
		emit_signal("changing_state",  character_node.jump_state_path.new() ) 
		
#Idle state: When you release the moving buttons
	if Input.is_action_just_released("w"):
		emit_signal("changing_state", character_node.idle_state_path.new() ) 
	if Input.is_action_just_released("s"):
		emit_signal("changing_state", character_node.idle_state_path.new() ) 
	if Input.is_action_just_released("a"):
		emit_signal("changing_state", character_node.idle_state_path.new() ) 
	if Input.is_action_just_released("d"):
		emit_signal("changing_state", character_node.idle_state_path.new() ) 
#	
func exit():
#	pass
	print("Exit function TURNING")