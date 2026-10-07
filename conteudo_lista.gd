extends VBoxContainer

# Carrega o nosso molde de cartão criado antes
const CARD_SCENE = preload("res://card_personagem.tscn")

# As 3 caixas onde os cartões vão ser colocados automaticamente
@onready var container_grupo = $ContainerGrupo
@onready var container_inimigos = $ContainerInimigos
@onready var container_npcs = $ContainerNpcs

func _ready() -> void:
	# Quando o jogo arranca, cria o teu personagem automaticamente no Grupo
	gerar_personagem("grupo", {"nome": "Kuzin", "classe": "Meio-Elfo Ladino Nível 3"})

# FUNÇÃO DO GERADOR: Cria um cartão do zero e mete-o na gaveta correta
func gerar_personagem(categoria: String, dados: Dictionary) -> void:
	var novo_card = CARD_SCENE.instantiate()
	
	# Envia os dados para o cartão se preencher sozinho
	if novo_card.has_method("inicializar"):
		novo_card.inicializar(dados)
		
	# Decide em qual das 3 caixas o cartão vai entrar
	match categoria:
		"grupo":
			container_grupo.add_child(novo_card)
		"inimigos":
			container_inimigos.add_child(novo_card)
		"npcs":
			container_npcs.add_child(novo_card)

# Função simples para avisar quando clicas num cartão
func abrir_ficha_detalhada(dados: Dictionary) -> void:
	print("A abrir ficha detalhada de: ", dados["nome"])

# BOTÕES DE TESTE RÁPIDO (Enquanto jogas com F5):
# Carrega na tecla 1 -> Cria um aliado no Grupo
# Carrega na tecla 2 -> Cria um Inimigo
# Carrega na tecla 3 -> Cria um NPC
func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_1:
			gerar_personagem("grupo", {"nome": "Tharok", "classe": "Meio-Orc Bárbara"})
		elif event.keycode == KEY_2:
			gerar_personagem("inimigos", {"nome": "Chefe Goblin", "classe": "Goblin Chefe"})
		elif event.keycode == KEY_3:
			gerar_personagem("npcs", {"nome": "Taberneiro", "classe": "Humano Comerciante"})
