class_name Player
extends KinematicBody2D

export var move_speed : int = 140
export var jump_speed : int = 300
export var gravity : int = 9.89 
export var velocity = Vector2()


enum States {
    Idle,
    Walk,
    Fall,
    Jump,
}

onready var stateNodes = {
    States.Idle : $"BaseState/Idle",
    States.Walk : $"BaseState/Walk",
    States.Fall : $"BaseState/Fall",
    States.Jump : $"BaseState/Jump",
}

var stateAnimations = {
    States.Idle : "idle",
    States.Walk : "walk",
    States.Fall : "fall",
    States.Jump : "jump",
}

onready var curr_state = stateNodes[ States.Idle ]

func _ready():
    for state in States:
        stateNodes[ States[state] ].init(self, $Animations, stateAnimations[ States[state] ], States)


func _unhandled_input( event: InputEvent ):
    var new_state_enum = curr_state.unhandled_input( event )
    if new_state_enum != null :
        change_state(new_state_enum)

func _physics_process ( delta: float ):
    var new_state_enum = curr_state.physics_process( delta )
    if new_state_enum != null :
        change_state(new_state_enum)


func change_state ( new_state_enum: int ) -> void:
    curr_state.exit()
    curr_state = stateNodes[new_state_enum]
    curr_state.enter()

