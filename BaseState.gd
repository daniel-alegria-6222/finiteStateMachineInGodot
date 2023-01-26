class_name BaseState
extends Node

var k_body
var animations
var animation_name
var states

func init ( _k_body: KinematicBody2D,  _animations: AnimatedSprite, _animation_name, _states ) -> void:
    k_body = _k_body
    animations = _animations
    animation_name = _animation_name
    states = _states

func enter () -> void:
    animations.play(animation_name)

func exit  () -> void:
    pass

func unhandled_input ( event: InputEvent ):
    return null

func physics_process ( delta: float ):
    return null

