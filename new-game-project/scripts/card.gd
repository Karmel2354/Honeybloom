extends Button

signal card_selected(card)

var card_name: String
var card_value: int

func set_card(name: String, value: int):
	card_name = name
	card_value = value

	$VBoxContainer/CardName.text = name
	$VBoxContainer/CardValue.text = str(value)

func _ready():
	modulate = Color.WHITE
	self_modulate = Color.WHITE
	add_theme_color_override(
		"font_color",
		Color.BLACK
	)

	pressed.connect(_on_pressed)

func _on_pressed():
	card_selected.emit(self)
