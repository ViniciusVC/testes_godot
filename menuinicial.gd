extends Control

#// Menu inicial do projeto.

func _ready():
	pass # Replace with function body.

func _process(delta):
	pass


func _on_button_game_3_pressed():
	#carregar a cena teste de salvar json em arquivo.
	get_tree().change_scene_to_file("res://salvar_dados.tscn") 

func _on_button_save_string_pressed():
	#carregar a cena teste de salvar string em arquivo.
	get_tree().change_scene_to_file("res://salvar_string.tscn")
