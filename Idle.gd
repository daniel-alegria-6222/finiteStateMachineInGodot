extends BaseState

func unhandled_input(event: InputEvent):
    if Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right"):
        return states.Walk
    elif Input.is_action_just_pressed("ui_up"):
        return states.Jump

    return null

func physics_process(delta: float):
    # aplica gravedad al jugador
    k_body.velocity.y += k_body.gravity
    k_body.velocity = k_body.move_and_slide(k_body.velocity, Vector2.UP)

    # 
    if ! k_body.is_on_floor():
        return states.Fall

    return null

