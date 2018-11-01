extends "res://States/StateBase.gd"


var character_node = null

func enter(character_node):
	print("Enter function Idle")
	self.character_node = 	character_node
#	character_node.move_and_slside(Vector3(0,0,0), Vector3(0,1,0))
	
func update(delta):
#Jump State
	if character_node.touch_floor:
		if Input.is_action_just_pressed("ui_jump"):
			emit_signal("changing_state",  character_node.jump_state_path.new() ) 
#Moving State
#		if(Vector3(0,0,1).dot(character_node.dir)
		
		if Input.is_action_just_pressed("w"):
			emit_signal("changing_state", character_node.moving_state_path.new() ) 
		if Input.is_action_just_pressed("s"):
			emit_signal("changing_state", character_node.moving_state_path.new() ) 
		if Input.is_action_just_pressed("a"):
			emit_signal("changing_state", character_node.moving_state_path.new() ) 
		if Input.is_action_just_pressed("d"):
			emit_signal("changing_state", character_node.moving_state_path.new() ) 
		
		#turn_back
		if Vector3(0,0,1).dot(character_node.dir) < 0:
			emit_signal("changing_state", character_node.turning_state_path.new() )
		if Vector3(0,0,-1).dot(character_node.dir) < 0:
			emit_signal("changing_state", character_node.turning_state_path.new() ) 
		if Vector3(1,0,0).dot(character_node.dir) < 0:
			emit_signal("changing_state", character_node.turning_state_path.new() ) 
		if Vector3(-1,0,0).dot(character_node.dir) < 0:
			emit_signal("changing_state", character_node.turning_state_path.new() ) 
			
		#turn of 90°
		#left
		#right
		
		
#	#Turning state
#		if Input.is_action_just_pressed("a"):
#			emit_signal("changing_state", character_node.turning_state_path.new() ) 
#		if Input.is_action_just_pressed("d"):
#			emit_signal("changing_state", character_node.turning_state_path.new()) 
#	
#			
	else: 
		if Input.is_action_just_pressed("ui_jump"):
			emit_signal("changing_state",  character_node.double_jump_state_path.new() ) 

		
func exit():
#	pass
	print("Exit function Idle")