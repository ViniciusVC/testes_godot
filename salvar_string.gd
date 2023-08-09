extends Control

#// Cena salvar string em arquivo

var contador = 0
var nomeARQUIVOstring = "user://save_string.data"

func _ready():
	carregar_string() # Carrega uma string ao iniciar.
	$Button.text = str(contador) # Mostrar valor da variavel no botão.

func salvar_string():
	print("salvar_string(): //Salvar string em arquivo")
	var file = FileAccess.open(nomeARQUIVOstring, FileAccess.WRITE)
	file.store_string(str(contador)) # Converte int em string para salvar no arquivo.
	file = null

func carregar_string():
	print("carregar_string(): //Carregando string.")
	if not FileAccess.file_exists(nomeARQUIVOstring):
		print("// Arquivo não existe.")
	else:
		print("// Carregando string.")
		var file = FileAccess.open(nomeARQUIVOstring, FileAccess.READ)
		print("Este é o valor que está no arquivo : "+file.get_as_text())
		contador =int(file.get_as_text()) # Converte string em int para aplicar a variavel.
		file = null

func _on_button_pressed():
	print("_on_button_pressed() // Pessionou botão contador")
	contador = contador + 1 # Soma um a variavel.
	$Button.text = str(contador) #Mostrar novo valor
	salvar_string() #salvar uma string em arquivo.
	pass # Replace with function body.
