extends Button

var dados_personagem: Dictionary = {}

func inicializar(dados: Dictionary) -> void:
	dados_personagem = dados
	
	var lbl_nome = get_node_or_null("LayoutCard/InfoPersonagem/NomeLabel")
	var lbl_classe = get_node_or_null("LayoutCard/InfoPersonagem/ClasseLabel")
	
	if lbl_nome: lbl_nome.text = dados.get("nome", "Desconhecido")
	if lbl_classe: lbl_classe.text = dados.get("classe", "Aventureiro")

func _pressed() -> void:
	var gestor = get_tree().root.find_child("ConteudoLista", true, false)
	if gestor and gestor.has_method("abrir_ficha_detalhada"):
		gestor.abrir_ficha_detalhada(dados_personagem)
