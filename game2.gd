extends Control

#// Não consegui fazer funcionar.
#//-PALAVRA-CRUZADA-exemplo2------------------------------------------------------------

# Neste exemplo, usarei uma matriz para representar o tabuleiro e algumas palavras para serem inseridas:

var random = RandomNumberGenerator.new() #import random

# Palavras para a palavra cruzada
var palavras = ['python', 'java', 'ruby', 'javascript', 'csharp']

# Tamanho do tabuleiro
var tamanho_tabuleiro = 10

# Inicializando o tabuleiro com espaços em branco
var tabuleiro = [[' ' for _ in range(tamanho_tabuleiro)] for _ in range(tamanho_tabuleiro)]

# Função para inserir palavras no tabuleiro
func inserir_palavra(palavra):
	var direcoes = [(0, 1), (1, 0)]  # Horizontal e vertical apenas para este exemplo
	var direcao = random.choice(direcoes)
	var x = random.randint(0, tamanho_tabuleiro - 1)
	var y = random.randint(0, tamanho_tabuleiro - 1)
	#rng.randf_range(-10.0, 10.0)
	for letra in palavra:
		if 0 <= x < tamanho_tabuleiro and 0 <= y < tamanho_tabuleiro and tabuleiro[y][x] == ' ':
			tabuleiro[y][x] = letra
			x = x + direcao[0]
			y = y + direcao[1]
		else:
			return False
	return True

# Função para exibir o tabuleiro
func exibir_tabuleiro():
	for linha in tabuleiro:
		print(' '.join(linha))

func _ready():
	# Inserindo as palavras no tabuleiro
	for palavra in palavras:
		while not inserir_palavra(palavra):
			print("Teste")
	# Exibindo o tabuleiro final
	exibir_tabuleiro()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
