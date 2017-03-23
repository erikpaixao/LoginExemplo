function excluirUsuario(id){
	if (confirm("Deseja realmente excluir?")){
		$.get("usuario/excluir?id=" + id, function(dadosDeResposta) {
	        alert("Usuário excluído!");
	        window.location.reload(false);
		});
	}
}