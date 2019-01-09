extends Node2D

var popup

func _ready():
	popup = get_node("MenuButton").get_popup()
	popup.add_item("TODO")
	popup.add_item("WIP")
	popup.add_item("DONE")
	# https://docs.godotengine.org/en/2.1/classes/class_popupmenu.html
	# https://docs.godotengine.org/en/3.0/classes/class_popupmenu.html
	# this is id_pressed or index_pressed on 3.
	popup.connect("item_pressed", self, "_on_item_pressed")

func _on_item_pressed(idx):
	var lbl = popup.get_item_text(idx)
	print("Label selected: ", lbl)
	get_node("Label").set_text(lbl)
