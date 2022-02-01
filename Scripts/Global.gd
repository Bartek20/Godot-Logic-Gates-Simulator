extends Node

var SCHEMATIC = load("res://Schematic.tscn").instance()

# Syntax [in, out, all]
var limits = [5, 1, 30]
var parts = [0, 0, 0] # Do not edit



func Runner():
	print('Program started succesfully :).')
	for amount in range(0, 3):
		parts[amount] = 0
	Blocker()

func Connector(mode, from, from_port, to, to_port):
	if (mode == 'Connect'):
		for item in self.get_node("/root/UI/Interface").get_connection_list():
			if item.to == to and item.to_port == to_port:
				return
		self.get_node("/root/UI/Interface").connect_node(from, from_port, to, to_port)
	else:
		self.get_node("/root/UI/Interface").disconnect_node(from, from_port, to, to_port)

func Adder(item):
	var Part = ''
	if (item == 'Input'):
		if (parts[0] < limits[0]):
			Part = SCHEMATIC.get_node(item).duplicate()
			parts[0] += 1
			if (parts[0] >= limits[0]):
				print ('You reached max amount of input elements.')
				self.get_node("/root/UI/Menu/Input").text = 'MAX Input reached...'
				self.get_node("/root/UI/Menu/Input").disabled = true
	elif (item == 'Output'):
		if (parts[1] < limits[1]):
			Part = SCHEMATIC.get_node(item).duplicate()
			parts[1] += 1
			if (parts[1] >= limits[1]):
				print ('You reached max amount of output elements.')
				self.get_node("/root/UI/Menu/Output").text = 'MAX Output reached...'
				self.get_node("/root/UI/Menu/Output").disabled = true
	else:
		Part = SCHEMATIC.get_node(item).duplicate()
	self.get_node("/root/UI/Interface").add_child(Part)
	Part.offset = Vector2(40, 40)
	parts[2] += 1
	Blocker()

func Blocker():
	self.get_node("/root/UI/Menu/Limit").text = str(parts[2]) + ' / ' + str(limits[2])
	if (parts[2] >= limits[2]):
		for button in range(3, self.get_node("/root/UI/Menu").get_child_count() - 4):
			if self.get_node("/root/UI/Menu").get_child(button) is Button:
				self.get_node("/root/UI/Menu").get_child(button).disabled = true
	elif (parts[2] < limits[2]):
		if (parts[0] < limits[0]):
			self.get_node("/root/UI/Menu/Input").text = 'Input'
			self.get_node("/root/UI/Menu/Input").disabled = false
		if (parts[1] < limits[1]):
			self.get_node("/root/UI/Menu/Output").text = 'Output'
			self.get_node("/root/UI/Menu/Output").disabled = false
		for button in range(6, self.get_node("/root/UI/Menu").get_child_count() - 4):
			self.get_node("/root/UI/Menu").get_child(button).disabled = false

func Remover(item, node):
	for con in node.get_parent().get_connection_list():
			if con.to == node.name or con.from == node.name:
				node.get_parent().disconnect_node(con.from, con.from_port, con.to, con.to_port)
	node.queue_free()
	parts[2] -= 1
	if (item == 'Input'):
		parts[0] -= 1
	elif (item == "Output"):
		parts[1] -= 1
	Blocker()

func Clearer(mode):
	if (mode == 'Connections'):
		self.get_node("/root/UI/Interface").clear_connections()
		self.get_node("/root/UI/Menu/Clear Connections").text = 'Connections Cleared'
		self.get_node("/root/UI/Menu/Clear Connections").disabled = true
		yield(get_tree().create_timer(1), "timeout")
		self.get_node("/root/UI/Menu/Clear Connections").text = 'Clear Connections'
		self.get_node("/root/UI/Menu/Clear Connections").disabled = false
	else:
		var nodes = self.get_node("/root/UI/Interface").get_children()
		for node in nodes:
			if node is GraphNode:
				node.queue_free()
		for amount in range(0,3):
			parts[amount] = 0
		Blocker()
		self.get_node("/root/UI/Menu/Clear Items").text = 'Items Cleared'
		self.get_node("/root/UI/Menu/Clear Items").disabled = true
		yield(get_tree().create_timer(1), "timeout")
		self.get_node("/root/UI/Menu/Clear Items").text = 'Clear Items'
		self.get_node("/root/UI/Menu/Clear Items").disabled = false
