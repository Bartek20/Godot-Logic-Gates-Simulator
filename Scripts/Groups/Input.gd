extends GraphNode



func _ready():
	self.offset = Vector2(25, 200)
	add_child(Label.new())
	get_child(self.get_node('.').get_child(0).get_child_count()).queue_free()

func _on_Remove_pressed():
	var slots = self.get_node('.').get_child(0)
	if (get_child_count() > 1):
		get_child(slots.get_child_count()).queue_free()
		self.rect_size = Vector2(get_size().x, get_size().y - 15)

func _on_Add_pressed():
	var slots = self.get_node('.').get_child(0)
	if (slots.get_child_count() < 11):
		add_child(Label.new())
		self.set_slot(self.get_child_count() - 1, true, 255, Color(0, 255, 255, 1), true, 0, Color(0, 255, 255, 1))
