extends Button

signal card_selected(card)

var card_name: String
var card_value: int

func set_card(name: String, value: int, texture: Texture2D):
	card_name = name
	card_value = value

	$VBoxContainer/CardName.text = name
	$VBoxContainer/CardValue.text = str(value)
	$CardArt.texture = texture

func _ready():
	pressed.connect(_on_pressed)

func _on_pressed():
	card_selected.emit(self)
