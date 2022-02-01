extends Control

var SCHEMATIC = load("res://Schematic.tscn").instance()

var IN = SCHEMATIC.get_node('./Input')
var OUT = SCHEMATIC.get_node('./Output')

var NOT = SCHEMATIC.get_node('./NOT')
var AND = SCHEMATIC.get_node('./AND')
var NAND = SCHEMATIC.get_node('./NAND')
var OR = SCHEMATIC.get_node('./OR')
var NOR = SCHEMATIC.get_node('./NOR')
var XOR = SCHEMATIC.get_node('./XOR')
var XNOR = SCHEMATIC.get_node('./XNOR')



func _ready():
	Global.Runner()

func _on_Interface_connection_request(from, from_port, to, to_port):
	for item in $Interface.get_connection_list():
		if item.to == to and item.to_port == to_port:
			return
	$Interface.connect_node(from, from_port, to, to_port)

func _on_Interface_disconnection_request(from, from_port, to, to_port):
	$Interface.disconnect_node(from, from_port, to, to_port)



func _on_Input_pressed():
	Global.Adder('Input')

func _on_Output_pressed():
	Global.Adder('Output')



func _on_NOT_pressed():
	Global.Adder('NOT')

func _on_AND_pressed():
	Global.Adder('AND')

func _on_NAND_pressed():
	Global.Adder('NAND')

func _on_OR_pressed():
	Global.Adder('OR')

func _on_NOR_pressed():
	Global.Adder('NOR')

func _on_XOR_pressed():
	Global.Adder('XOR')

func _on_XNOR_pressed():
	Global.Adder('XNOR')


	
func _on_Clear_Connections_pressed():
	$Interface.clear_connections()
	$"Menu/Clear Connections".text = 'Connections Cleared'
	$"Menu/Clear Connections".disabled = true
	yield(get_tree().create_timer(1), "timeout")
	$"Menu/Clear Connections".text = 'Clear Connections'
	$"Menu/Clear Connections".disabled = false

func _on_Clear_Items_pressed():
	var nodes = $Interface.get_children()
	for node in nodes:
		if node is GraphNode:
			node.queue_free()
	for amount in range(0,3):
		Global.parts[amount] = 0
	Global.Blocker()
	$"Menu/Clear Items".text = 'Items Cleared'
	$"Menu/Clear Items".disabled = true
	yield(get_tree().create_timer(1), "timeout")
	$"Menu/Clear Items".text = 'Clear Items'
	$"Menu/Clear Items".disabled = false



func _on_Start_pressed():
	var CONNECTIONS_List = $Interface.get_connection_list()
	if (CONNECTIONS_List.empty() == false):
		for i in range(0, CONNECTIONS_List.size()):
			print(CONNECTIONS_List[i])
