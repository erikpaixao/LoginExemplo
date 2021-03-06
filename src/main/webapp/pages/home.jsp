<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<title>Sistema de Controle de Ponto | Bem-vindo</title>

<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<%@ include file="../fragments/header.jsp"%>
	<div class="container">
		<h1>Bem-vindo, ${(usuarioLogado.name == null) ? usuarioLogado.username : usuarioLogado.name}</h1>
		<div class="row">
			<div class="page-header">
				<h1>
					<small>Atividades</small>
				</h1>
			</div>
			<div class="col-md-3">

				<div class="list-group">
					<a href="#" class="list-group-item"> Cras justo odio <span
						class="badge">14</span></a> <a href="#" class="list-group-item">Dapibus
						ac facilisis in <span class="badge">14</span>
					</a> <a href="#" class="list-group-item">Morbi leo risus <span
						class="badge">14</span></a> <a href="#" class="list-group-item">Porta
						ac consectetur ac <span class="badge">14</span>
					</a> <a href="#" class="list-group-item">Vestibulum at eros <span
						class="badge">14</span></a>
				</div>
			</div>
			<div class="col-md-4">
				<div class="list-group">
					<a href="#" class="list-group-item"> Cras justo odio <span
						class="badge">14</span></a> <a href="#" class="list-group-item">Dapibus
						ac facilisis in <span class="badge">14</span>
					</a> <a href="#" class="list-group-item">Morbi leo risus <span
						class="badge">14</span></a> <a href="#" class="list-group-item">Porta
						ac consectetur ac <span class="badge">14</span>
					</a> <a href="#" class="list-group-item">Vestibulum at eros <span
						class="badge">14</span></a>
				</div>

			</div>
			<div class="col-md-5">
				<div id="piechart" style="width: 100%;"></div>
			</div>
		</div>

	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	<script src="${contextPath}/resources/js/source.js"></script>
</body>
</html>
