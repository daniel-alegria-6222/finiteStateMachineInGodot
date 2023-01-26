extends BaseState

func unhandled_input ( event: InputEvent ):
    if Input.is_action_just_pressed("ui_up"):
        return states.Jump
    return null

func physics_process(delta: float):
    if !k_body.is_on_floor():
        return states.Fall

    ###
    var dir = 0
    if Input.is_action_pressed("ui_left"):
        dir = -1
        animations.flip_h = true
    elif Input.is_action_pressed("ui_right"):
        dir = 1
        animations.flip_h = false

    k_body.velocity.x = dir * k_body.move_speed
    k_body.velocity.y += k_body.gravity
    k_body.velocity = k_body.move_and_slide(k_body.velocity, Vector2.UP)

    ###

    if dir == 0:
        return states.Idle

    return null
