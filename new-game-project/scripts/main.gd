extends Control

const CARD_SCENE = preload("res://scenes/Card.tscn")

@export var master_sheets: Array[Texture2D]

var deck = [
	{"name": "r1", "value": 10, "sheet": 0, "col": 0, "row": 0},
	{"name": "b1", "value": 10, "sheet": 0, "col": 1, "row": 0},
	{"name": "y1", "value": 10, "sheet": 0, "col": 2, "row": 0},
	{"name": "w1", "value": 10, "sheet": 0, "col": 3, "row": 0},
	{"name": "yb1", "value": 4, "sheet": 0, "col": 4, "row": 0},
	{"name": "r2", "value": 15, "sheet": 0, "col": 0, "row": 1},
	{"name": "b2", "value": 15, "sheet": 0, "col": 1, "row": 1},
	{"name": "y2", "value": 15, "sheet": 0, "col": 2, "row": 1},
	{"name": "w2", "value": 15, "sheet": 0, "col": 3, "row": 1},
	{"name": "yb2", "value": 6, "sheet": 0, "col": 4, "row": 1},
	{"name": "r3", "value": 20, "sheet": 0, "col": 0, "row": 2},
	{"name": "b3", "value": 20, "sheet": 0, "col": 1, "row": 2},
	{"name": "y3", "value": 20, "sheet": 0, "col": 2, "row": 2},
	{"name": "w3", "value": 20, "sheet": 0, "col": 3, "row": 2},
	{"name": "yb3", "value": 8, "sheet": 0, "col": 4, "row": 2},
]

const CARD_WIDTH = 696
const CARD_HEIGHT = 822
const COLS = 5

# Margins
const SPACING_X = 6.7
const SPACING_Y = 5.6

func setup_card_textures() -> void:
	for card_data in deck:
		var sheet_index = card_data.get("sheet", 0)
		
		if sheet_index >= master_sheets.size() or master_sheets[sheet_index] == null:
			print("Error: Sheet index ", sheet_index, " is missing or not assigned!")
			continue
		
		# Atlas - podzial obrazu na karty
		var atlas_tex = AtlasTexture.new()
		atlas_tex.atlas = master_sheets[sheet_index]
		
		var col = card_data["col"]
		var row = card_data["row"]
		
		var x_pos = col * (CARD_WIDTH + SPACING_X)
		var y_pos = row * (CARD_HEIGHT + SPACING_Y)
		
		atlas_tex.region = Rect2(x_pos, y_pos, CARD_WIDTH, CARD_HEIGHT)
		card_data["texture"] = atlas_tex
		
		print("Loaded card: ", card_data["name"], " at pixel position X: ", x_pos, ", Y: ", y_pos)


func _ready():
	setup_card_textures()
	deck.shuffle()

	$DrawPile.text = "DRAW"
	$DrawPile.disabled = false

	$DrawPile.pressed.connect(draw)
	
	$DiscardPile.text = "DISCARD"
	$DiscardPile.disabled = false

	$DiscardPile.pressed.connect(discard)

	print("Game ready!")


func draw():
	if $Hand.get_child_count() >= 5:
		$Info.text = "Your hand is full!"
		return


	for i in range(5):
		if deck.is_empty():
			break
		
		if $Hand.get_child_count() >= 5:
			$Info.text = "Your hand is full!"
			break

		var card_data = deck.pop_back()
		var card = CARD_SCENE.instantiate()

		$Hand.add_child(card)
		card.set_card(card_data["name"], card_data["value"], card_data.get("texture", null))
		card.card_selected.connect(select_card)

	$Info.text = "Drew cards. Cards left in deck: " + str(deck.size())


func discard():
	for child in $Hand.get_children():
		child.queue_free()
	
	$Info.text = "Discarded hand!"


func select_card(card):
	$Info.text = "Selected: " + card.card_name


func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
