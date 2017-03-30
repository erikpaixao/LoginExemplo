function excluirUsuario(id){
	if (confirm("Deseja realmente excluir?")){
		$.get("/usuario/excluir?id=" + id, function(dadosDeResposta) {
	        alert("Usuário excluído!");
	        window.location.reload(false);
		});
	}
}

function excluirAtividade(id){
	if (confirm("Deseja realmente excluir?")){
		$.get("/atividade/excluir?id=" + id, function(dadosDeResposta) {
	        alert("Usuário excluído!");
	        window.location.reload(false);
		});
	}
}

function excluirRegra(id){
	if (confirm("Deseja realmente excluir?")){
		$.get("/regra/excluir?id=" + id, function(dadosDeResposta) {
	        alert("Usuário excluído!");
	        window.location.reload(false);
		});
	}
}

google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

function drawChart() {

  var data = google.visualization.arrayToDataTable([
    ['Task', 'Hours per Day'],
    ['Work',     11],
    ['Eat',      2],
    ['Commute',  2],
    ['Watch TV', 2],
    ['Sleep',    7]
  ]);

  var options = {
    title: 'My Daily Activities'
  };

  var chart = new google.visualization.PieChart(document.getElementById('piechart'));

  chart.draw(data, options);
}