extends Node2D

const Functional = preload("Functional.gd")
const StatusMenuButton = preload("StatusMenuButton.gd")

onready var F = Functional.new()
onready var smb = StatusMenuButton.new()

var states = ["TODO", "WIP", "DONE"]
var bx = 100
var by = 100

func _ready():
	smb.connect("picked", self, "_on_picked")
	add_child(smb)
	F.map(self, "make_smb", ["Button One", "Button Two", "Button Three"])

func make_smb(lbl):
	by += 30
	printt("Making it", lbl)
	return smb.add(self, 200, 20, lbl, states, bx, by)

func _on_picked(p):
	get_node("Label").set_text(p)
