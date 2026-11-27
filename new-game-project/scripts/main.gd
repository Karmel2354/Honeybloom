extends Control

const CARD_SCENE = preload("res://scenes/Card.tscn")

var deck = [
	{"name": "Fire", "value": 5},
	{"name": "Water", "value": 3},
	{"name": "Earth", "value": 7},
	{"name": "Wind", "value": 4},
	{"name": "Lightning", "value": 9},
	{"name": "Ice", "value": 6}
]

func _ready():
	deck.shuffle()

	$Deck.text = "DRAW CARD"
	$Deck.disabled = false
	$Deck.mouse_filter = Control.MOUSE_FILTER_STOP

	$Deck.pressed.connect(draw_card)

	print("Game ready!")

func draw_card():

	if $Hand.get_child_count() >= 5:
		$Info.text = "Your hand is full!"
		return

	if deck.is_empty():
		print("Deck is empty!")
		return

	var card_data = deck.pop_back()
	var card = CARD_SCENE.instantiate()

	$Hand.add_child(card)
	card.set_card(card_data["name"], card_data["value"])

	card.card_selected.connect(select_card)

	$Info.text = "Drew: " + card_data["name"]

func select_card(card):
	$Info.text = "Selected: " + card.card_name

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
