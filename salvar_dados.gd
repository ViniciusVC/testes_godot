extends Control

#// Cena salvar JSON em arquivo

var pontos = 0
var capitulo = "1-inicial"
var etapa = "testes1"
var datajson = {"pontos": 0,"capitulo": "1-inicial","etapa": "testes1"}
var nomeARQUIVOjson = "user://save_json.data"

func _ready():
	# Iniciando cena.
	carregar_dados() # Carrega dados ao iniciar.
	mostrarInformacoes() # Mostrar valor da variaveis.

func mostrarInformacoes():
	print("capitulo:"+str(capitulo))
	print("pontos"+str(pontos))
	print("etapa"+str(etapa))
	$LabelCapitulo.text = "capitulo:"+str(capitulo)
	$LabelPontos.text = "pontos"+str(pontos)
	$LabelEtapa.text = "etapa"+str(etapa)

func somarValor():
	pontos = pontos+1
	if capitulo=="0-inicial":
		capitulo = "1-aprendis"
	elif capitulo=="1-aprendis":
		capitulo = "2-gerente"
	elif capitulo=="2-gerente":
		capitulo = "3-diretor"
	else:
		capitulo = "0-inicial"
	if etapa == "testes1":
		etapa = "testes1"
	else:
		etapa = "testes2"

func _process(delta):
	# Called every frame. 'delta' is the elapsed time since the previous frame.
	pass

func salvar_dados():
	print("salvar_dados():")
	datajson = {"pontos": pontos,"capitulo": capitulo,"etapa": etapa}
	var file = FileAccess.open(nomeARQUIVOjson, FileAccess.WRITE)
	file.store_var(datajson)
	file = null
	
	
func carregar_dados():
	if not FileAccess.file_exists(nomeARQUIVOjson):
		print("arquivo não existe")
		datajson = {"pontos": pontos,"capitulo": capitulo,"etapa": etapa}
	else:
		print("carregar_dados()")
		var file = FileAccess.open(nomeARQUIVOjson, FileAccess.READ)
		print(file.get_as_text())
		# datajson = file.get_as_text()
		datajson = file.get_var()
		file = null
	pontos=datajson["pontos"] 
	capitulo=datajson["capitulo"]
	etapa=datajson["etapa"]


func _on_button_json_pressed():
	print("_on_button_pressed() // Pessionou botão salvar JSON")
	somarValor()
	mostrarInformacoes()
	salvar_dados() #salvar novo valor em arquivo.
	
