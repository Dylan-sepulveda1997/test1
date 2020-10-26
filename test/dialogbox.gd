extends Control
var dialog =["1","2","3"]
var dialog_index=0
var finished = false

func _ready():
	load_dialog()
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		load_dialog()

func load_dialog():
	if dialog_index < dialog.size():
		$RichTextLabel.bbcode_text=dialog[dialog_index]
	if dialog_index == dialog.size():
		get_tree().change_scene("res://Node2D.tscn")
	#	$RichTextLabel.percent_visible=0
	#else:
	#	queue_free()
	dialog_index +=1
	
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when t:
 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
