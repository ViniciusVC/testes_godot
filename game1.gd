extends Control

#// Não consegui fazer funcionar.
#-PALAVRA-CRUZADA-exemplo1------------------------------------------------------------
class PalavrasCruzadas:
	func __init__(self, grade):
		self.grade = grade

	func mostrar_grade(self):
		for linha in self.grade:
			print(" ".join(linha))

	func preencher_palavra(self, palavra, dica, linha, coluna, direcao):
		if direcao == 'horizontal':
			for i in range(len(palavra)):
				self.grade[linha][coluna + i] = palavra[i]
		elif direcao == 'vertical':
			for i in range(len(palavra)):
				self.grade[linha + i][coluna] = palavra[i]

	func validar_preenchimento(self, palavra, linha, coluna, direcao):
		if direcao == 'horizontal':
			for i in range(len(palavra)):
				if coluna + i >= len(self.grade[0]) or self.grade[linha][coluna + i] != '.':
					return False
		elif direcao == 'vertical':
			for i in range(len(palavra)):
				if linha + i >= len(self.grade) or self.grade[linha + i][coluna] != '.':
					return False
		return True


func main():
	# Exemplo de palavras cruzadas e suas dicas
	grade = [
		['.', '.', '.', '.', '.', '.', '.'],
		['.', '.', '.', '.', '.', '.', '.'],
		['.', '.', '.', '.', '.', '.', '.'],
		['.', '.', '.', '.', '.', '.', '.'],
		['.', '.', '.', '.', '.', '.', '.'],
		['.', '.', '.', '.', '.', '.', '.'],
	]
	jogo = PalavrasCruzadas(grade)

	# Preenchendo algumas palavras no tabuleiro (exemplo)
	jogo.preencher_palavra('CASA', 'Lar', 1, 1, 'horizontal')
	jogo.preencher_palavra('RODA', 'Veículo', 3, 1, 'vertical')

	# Mostrar o tabuleiro
	print("Palavras Cruzadas:")
	jogo.mostrar_grade()

if __name__ == "__main__":
	main()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
