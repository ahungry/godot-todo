extends Node2D

const StatusMenuButton = preload("StatusMenuButton.gd")

func _ready():
	var smb = StatusMenuButton.new()
	smb.connect("picked", self, "_on_picked")
	add_child(smb)

	var b2 = smb.add(self, 200, 100, "Click me I am b2")
	var b3 = smb.add(self, 200, 100, "Click me I am b3")

func _on_picked(p):
	get_node("Label").set_text(p)
