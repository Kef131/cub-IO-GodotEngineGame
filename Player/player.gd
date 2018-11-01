	#Copyright (c) 2017 Yakanda Studios | Mantra: Going to next level

#Permission is hereby granted, free of charge, to any person obtaining a copy
#of this software and associated documentation files (the "Software"), to deal
#in the Software without restriction, including without limitation the rights
#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the Software is
#furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in all
#copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#SOFTWARE.
extends KinematicBody

var jump_state_path = preload("res://States/JumpState.gd")
var turning_state_path = preload("res://States/TurningState.gd")
var moving_state_path = preload("res://States/MovingState.gd")
var idle_state_path = preload("res://States/IdleState.gd")
var double_jump_state_path = preload("res://States/DoubleJumpState.gd")

var speed = 5
var gravity = -2
var jump_speed = 0.8
var dir = Vector3()

var vectorDir = Vector3()
var current_position = Vector3()

var current_rotation = Vector3()

var touch_floor = false

func _ready():
	current_position = get_node(".").get_transform().origin
	set_process(true)
	
#Set free the character object and pause the game
func die():
	queue_free()
	get_tree().set_pause(true)

#Press A	
func move_z( delta):
	print("Move")
	current_position.z += delta* 20
	move_and_slide(current_position)

func move_forwards(delta, vector):
	dir = vector
	if dir.z != 0:
		dir.z += delta * speed
	elif dir.x != 0:
		dir.x += delta * speed
	move(dir)
	

	
func turn( deg):
	
	rotate_y(deg)
#	if(scalarDot>0):
#		rotate_y(deg)
#		pass
#	elif scalarDot<0:
#		rotate_y(deg)
#		pass
#	elif scalarDot==0:
#		pass

	
#Press D
#func turn_right():
#	rotate_y(90)
	
#	var aux = get_global_transform()
#	rotated(Vector3(0,1,0), (deg2rad(90)))
#	set_global_transform(aux)
	
#	global_rotate( Vector3(0,1,0), -1.5708 )
	
#Press A
#func turn_left():
#	global_rotate( Vector3(0,1,0), 1.5708 )
#	
#func half_turn():
#	global_rotate( Vector3(0,1,0), 3.1416 )
	


#	var aux = get_global_transform()
#	aux.origin.rotated(Vector3(0,1,0), (deg2rad(180)))
#	set_global_transform(aux)
func jump():
	dir.y = jump_speed
	pass
	
#It has the functionality about the gravitiy and movement of the character
func _process(delta):	
	printt(Vector3(0,0,1).dot(dir))
#	print(touch_floor)
	current_position = get_node(".").get_transform().origin
#	print(dir)
	dir.y += delta*gravity
	move(dir)
#	print(current_position)
#	print(current_rotation)
#	print(is_on_floor())

	#set_floor_properties(normal,slope)
	#move(speed*delta)
	#if(is_on_floor()):
#	
#

func _on_Area_body_entered( body ):
	if(body.is_in_group("floor")):
		touch_floor = true

func _on_Area_body_exited( body ):
	if(body.is_in_group("floor")):
		touch_floor = false