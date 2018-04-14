extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export (PackedScene) var LEVEL

func _ready():
	var level = LEVEL.instance()
	level.connect("reset",self,"_on_reset")
	add_child(level)
	
	pass

func _on_reset():
	print('bananas3')
	for child in get_children():
		if child.is_in_group("level"):
			var level = LEVEL.instance()
			child.queue_free()
			level.connect("reset",self,"_on_reset")
			add_child(level)
func _process(delta):
	pass
