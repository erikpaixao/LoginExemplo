<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="description" value="${pageContext.request.contextPath}" />
<c:set var="author" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="pt_BR">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="${description}">
<meta name="author" content="${author}">

<title>${usuarios[0].username}</title>

<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<%@ include file="../../fragments/header.jsp"%>
	<div class="container">
		<div class="header">
			<div class="row">
				<div class="col-md-2">
					<figure>
						<img alt="" src="${usuarioLogado.avatar}">
					</figure>
				</div>
				<div class="col-md-10">
					<div class="row">
						<div class="col-md-6">
							<div>${usuarioLogado.name}</div>
							<div>${usuarioLogado.email}</div>
						</div>
						<div class="col-md-6">
							<div>${usuarioLogado.phone}</div>
						</div>
					</div>
				</div>

			</div>

		</div>
		<table class="table table-striped">
			<tr>
				<th>ID</th>
				<th>Foto</th>
				<th>Nome</th>
				<th>Usuario</th>
				<th>E-Mail</th>
				<th>Telefone</th>
				<th>Permiss�es</th>
				<th>Op��es</th>
			</tr>
			<tr>
				<td>${role.id}</td>
				<td>
					<figure>
						<img src="${usuario.avatar}" />
					</figure>
				</td>
				<td>${role.name}</td>
				<td>${role.username}</td>
				<td>${role.email}</td>
				<td>${role.phone}</td>
				<td><c:forEach items="${usuario.roles}" var="role">
						<ul>
							<li>${role.name}</li>
						</ul>
					</c:forEach></td>
				<td><a href="#" data-toggle="modal"
					data-target="#editarUsuario">Editar</a> <a href="#"
					onclick="excluirUsuario(${usuario.id});">Excluir</a></td>
			</tr>
		</table>

	</div>
	<!-- /container -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${contextPath}/resources/js/source.js"></script>
</body>
</html>
