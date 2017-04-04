function alterarStatus(id, redirect){
	if (confirm("Deseja alterar Status?")){
		$.get("/usuario/alterarStatus?id=" + id, function(dadosDeResposta) {
	        alert("Operaçao realizada com sucesso!");
	        window.location = "/" + redirect;
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