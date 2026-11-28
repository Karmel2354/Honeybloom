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
	
	{"name": "wy1", "value": 4, "sheet": 1, "col": 0, "row": 0},
	{"name": "bw1", "value": 4, "sheet": 1, "col": 1, "row": 0},
	{"name": "wr1", "value": 4, "sheet": 1, "col": 2, "row": 0},
	{"name": "br1", "value": 4, "sheet": 1, "col": 3, "row": 0},
	{"name": "ry1", "value": 4, "sheet": 1, "col": 4, "row": 0},
	{"name": "wy2", "value": 6, "sheet": 1, "col": 0, "row": 1},
	{"name": "bw2", "value": 6, "sheet": 1, "col": 1, "row": 1},
	{"name": "wr2", "value": 6, "sheet": 1, "col": 2, "row": 1},
	{"name": "br2", "value": 6, "sheet": 1, "col": 3, "row": 1},
	{"name": "ry2", "value": 6, "sheet": 1, "col": 4, "row": 1},
	{"name": "wy3", "value": 8, "sheet": 1, "col": 0, "row": 2},
	{"name": "bw3", "value": 8, "sheet": 1, "col": 1, "row": 2},
	{"name": "wr3", "value": 8, "sheet": 1, "col": 2, "row": 2},
	{"name": "br3", "value": 8, "sheet": 1, "col": 3, "row": 2},
	{"name": "ry3", "value": 8, "sheet": 1, "col": 4, "row": 2},
	
	{"name": "rrb1", "value": 2, "sheet": 2, "col": 0, "row": 0},
	{"name": "rry1", "value": 2, "sheet": 2, "col": 1, "row": 0},
	{"name": "rrw1", "value": 2, "sheet": 2, "col": 2, "row": 0},
	{"name": "bbr1", "value": 2, "sheet": 2, "col": 3, "row": 0},
	{"name": "bby1", "value": 2, "sheet": 2, "col": 4, "row": 0},
	{"name": "rrb2", "value": 3, "sheet": 2, "col": 0, "row": 1},
	{"name": "rry2", "value": 3, "sheet": 2, "col": 1, "row": 1},
	{"name": "rrw2", "value": 3, "sheet": 2, "col": 2, "row": 1},
	{"name": "bbr2", "value": 3, "sheet": 2, "col": 3, "row": 1},
	{"name": "bby2", "value": 3, "sheet": 2, "col": 4, "row": 1},
	{"name": "rrb3", "value": 4, "sheet": 2, "col": 0, "row": 2},
	{"name": "rry3", "value": 4, "sheet": 2, "col": 1, "row": 2},
	{"name": "rrw3", "value": 4, "sheet": 2, "col": 2, "row": 2},
	{"name": "bbr3", "value": 4, "sheet": 2, "col": 3, "row": 2},
	{"name": "bby3", "value": 4, "sheet": 2, "col": 4, "row": 2},
	
	{"name": "bbw1", "value": 2, "sheet": 3, "col": 0, "row": 0},
	{"name": "yyr1", "value": 2, "sheet": 3, "col": 1, "row": 0},
	{"name": "yyb1", "value": 2, "sheet": 3, "col": 2, "row": 0},
	{"name": "yyw1", "value": 2, "sheet": 3, "col": 3, "row": 0},
	{"name": "wwr1", "value": 2, "sheet": 3, "col": 4, "row": 0},
	{"name": "bbw2", "value": 3, "sheet": 3, "col": 0, "row": 1},
	{"name": "yyr2", "value": 3, "sheet": 3, "col": 1, "row": 1},
	{"name": "yyb2", "value": 3, "sheet": 3, "col": 2, "row": 1},
	{"name": "yyw2", "value": 3, "sheet": 3, "col": 3, "row": 1},
	{"name": "wwr2", "value": 3, "sheet": 3, "col": 4, "row": 1},
	{"name": "bbw3", "value": 4, "sheet": 3, "col": 0, "row": 2},
	{"name": "yyr3", "value": 4, "sheet": 3, "col": 1, "row": 2},
	{"name": "yyb3", "value": 4, "sheet": 3, "col": 2, "row": 2},
	{"name": "yyw3", "value": 4, "sheet": 3, "col": 3, "row": 2},
	{"name": "wwr3", "value": 4, "sheet": 3, "col": 4, "row": 2},
	
	{"name": "wwb1", "value": 2, "sheet": 4, "col": 0, "row": 0},
	{"name": "wwy1", "value": 2, "sheet": 4, "col": 1, "row": 0},
	{"name": "rby1", "value": 2, "sheet": 4, "col": 2, "row": 0},
	{"name": "wrb1", "value": 2, "sheet": 4, "col": 3, "row": 0},
	{"name": "ywr1", "value": 2, "sheet": 4, "col": 4, "row": 0},
	{"name": "wwb2", "value": 3, "sheet": 4, "col": 0, "row": 1},
	{"name": "wwy2", "value": 3, "sheet": 4, "col": 1, "row": 1},
	{"name": "rby2", "value": 3, "sheet": 4, "col": 2, "row": 1},
	{"name": "wrb2", "value": 3, "sheet": 4, "col": 3, "row": 1},
	{"name": "ywr2", "value": 3, "sheet": 4, "col": 4, "row": 1},
	
	{"name": "byw1", "value": 2, "sheet": 5, "col": 0, "row": 0},
	{"name": "byw2", "value": 3, "sheet": 5, "col": 0, "row": 1},
	{"name": "byw3", "value": 4, "sheet": 5, "col": 0, "row": 2},
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
