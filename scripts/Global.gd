extends Node


onready var scrollContainer = get_tree().get_root().get_node('TodoList/Scroller/Items')

var item = load('res://Item.tscn')
var itemsList = []
var nodeList = []

var i = 0


func _ready() -> void:
	if loadContent().size() > 0:
		for itemIter in loadContent():
			addItem(itemIter)
		


func addItem(itemToAdd):
	itemsList.push_back(itemToAdd)
	nodeList.push_back(item.instance())
	nodeList[i].get_node('ItemLabel').text = itemsList[i]
	nodeList[i].name = itemToAdd
	scrollContainer.add_child(nodeList[i])
	i += 1
	saveContent(itemsList)


func removeItem(itemToRemove, reference):
	scrollContainer.get_node(itemToRemove).queue_free()
	itemsList.erase(itemToRemove)
	nodeList.erase(reference)
	i -= 1
	saveContent(itemsList)


func saveContent(content):
	var file = File.new()
	
	file.open("user://todoList.json", File.WRITE)
	file.store_line(to_json({"content": content}))
	file.close()


func loadContent():
	var file = File.new()
	if file.file_exists("user://todoList.json"):
		file.open("user://todoList.json",file.READ)
		var tmp_data = file.get_as_text()
		file.close()
		
		var dict = parse_json(tmp_data)
		if not tmp_data == '':
			return dict['content']
	return []
