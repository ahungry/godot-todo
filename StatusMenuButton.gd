extends MenuButton

signal picked
onready var popup = get_popup()

func _ready():
	set_text("Select an option:")

	#popup = get_popup()
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
	emit_signal("picked", lbl)
	#get_node("Label").set_text(lbl)

func add(parent, w, h, label):
	var smb = StatusMenuButton.new(w, h, label)
	parent.add_child(smb)
	return smb

# https://docs.godotengine.org/en/3.0/tutorials/gui/size_and_anchors.html
class StatusMenuButton extends MenuButton:
	func _init(w, h, label):
		print("Width: ", w, "Height: ", h)
		set_text(label)
		set_pos(Vector2(w, h))
