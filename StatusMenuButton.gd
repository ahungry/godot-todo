extends MenuButton

const Functional = preload("Functional.gd")

# Factory
func add(parent, w, h, label, opts, x, y):
	var smb = StatusMenuButton.new(w, h, label, opts, x, y)
	parent.add_child(smb)
	return smb

# https://docs.godotengine.org/en/3.0/tutorials/gui/size_and_anchors.html
class StatusMenuButton extends MenuButton:
	signal picked
	var F = Functional.new()
	var popup

	func _add_items(opts):
		F.map(popup, "add_item", opts)

	func _init(w, h, label, opts, x, y):
		set_text(label)
		set_pos(Vector2(x, y))
		set_flat(false)
		popup = get_popup()
		_add_items(opts)
		# https://docs.godotengine.org/en/2.1/classes/class_popupmenu.html
		# https://docs.godotengine.org/en/3.0/classes/class_popupmenu.html
		# this is id_pressed or index_pressed on 3.
		popup.connect("item_pressed", self, "_on_item_pressed")

	func _on_item_pressed(idx):
		var lbl = popup.get_item_text(idx)
		print("Label selected: ", lbl)
		emit_signal("picked", lbl)
		#get_node("Label").set_text(lbl)
