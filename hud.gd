extends CanvasLayer

@onready var style: StyleBoxFlat = $Border.get_theme_stylebox("panel")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Border.hide()
	$Level.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_p_1_jumped() -> void:
	style.border_color = Color.CADET_BLUE

func _on_p_2_jumped() -> void:
	style.border_color = Color.INDIAN_RED
