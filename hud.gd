extends CanvasLayer

signal start_game

@onready var style: StyleBoxFlat = $Border.get_theme_stylebox("panel")
var level = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_p_1_jumped() -> void:
	style.border_color = Color.CADET_BLUE

func _on_p_2_jumped() -> void:
	style.border_color = Color.INDIAN_RED

func _on_start_pressed() -> void:
	$Title.hide()
	$Title2.hide()
	$Start.hide()
	$Background.hide()
	$Border.show()
	$Level.show()
	start_game.emit()

func game_end():
	$Background.show()
	$YouWin.show()
	$YouWin2.show()
	$Border.hide()

func _on_main_level_finished() -> void:
	level += 1
	$Level.text = "Level " + str(level)


func _on_main_game_finish() -> void:
	game_end()
