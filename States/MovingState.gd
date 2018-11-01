extends "res://States/StateBase.gd"

var character_node = null

func enter(character_node):
	print("Enter function MOVING")
	self.character_node = character_node
	
func update(delta):
#Moving State
#	if character_node.dir 
	if Input.is_action_pressed("w"):
		character_node.move_forwards(delta, Vector3(0,0,1) )
	if Input.is_action_pressed("s"):
		character_node.move_forwards(delta, Vector3(0,0,-1) )
	if Input.is_action_pressed("a"):
		character_node.move_forwards(delta, Vector3(1,0,0) )
	if Input.is_action_pressed("d"):
		character_node.move_forwards(delta, Vector3(-1,0,0) )

#Turning state
	if Input.is_action_just_pressed("d"):
		emit_signal("changing_state", character_node.turning_state_path.new() ) 
	if Input.is_action_just_pressed("d"):
		emit_signal("changing_state", character_node.turning_state_path.new() )
	if Input.is_action_just_pressed("d"):
		emit_signal("changing_state", character_node.turning_state_path.new() ) 
	if Input.is_action_just_pressed("d"):
		emit_signal("changing_state", character_node.turning_state_path.new() ) 
		
#Idle state: When you release the moving buttons
	if Input.is_action_just_released("w"):
		emit_signal("changing_state", character_node.idle_state_path.new() ) 
	if Input.is_action_just_released("s"):
		emit_signal("changing_state", character_node.idle_state_path.new() ) 
	if Input.is_action_just_released("a"):
		emit_signal("changing_state", character_node.idle_state_path.new() ) 
	if Input.is_action_just_released("d"):
		emit_signal("changing_state", character_node.idle_state_path.new() ) 
		
#Jump State
	if Input.is_action_pressed("ui_jump"):
		emit_signal("changing_state",  character_node.jump_state_path.new() ) 

func exit():
#	pass
	print("Exit function MOVING")