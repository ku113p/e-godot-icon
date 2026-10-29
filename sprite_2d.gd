extends Sprite2D

signal health_depleted

var speed: int = 400
var angular_speed: float = PI

func _process(delta: float) -> void:
	var velocity: Vector2 = Vector2.UP.rotated(rotation) * speed
	rotation += angular_speed * delta
	position += velocity * delta


func _on_button_pressed() -> void:
	set_process(not is_processing())


func _ready() -> void:
	var timer: Timer = get_node("Timer")
	timer.timeout.connect(_on_timer_timeout)


func _on_timer_timeout() -> void:
	visible = not visible
