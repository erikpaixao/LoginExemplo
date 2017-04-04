<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="description" value="${pageContext.request.contextPath}" />
<c:set var="author" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="pt_BR">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="${description}">
<meta name="author" content="${author}">

<title>${usuarios[0].username}</title>

<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">
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
			<button class="btn btn-default btn-sm" type="submit">Nova
				Regra</button>
		</div>

		<table class="table table-striped">
			<tr>
				<th>ID</th>
				<th>Nome</th>
				<th>Usuarios</th>
				<th>Op��es</th>
			</tr>
			<c:forEach items="${regras}" var="regra" varStatus="f">
				<tr>
					<td>${regra.id}</td>
					<td onmouseover="this.style.cursor='pointer'"
						onclick="window.location ='/regra/${regra.id}'">${regra.name}</td>

					<td><ul>
							<c:forEach items="${regra.users}" var="usuarioRegra">
								<c:if test="${usuarioRegra.isAtivo}">
									<li>${usuarioRegra.username}</li>
								</c:if>
							</c:forEach>
						</ul></td>
					<td><a href="#" onclick="excluirUsuario(${regra.id});">Excluir</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<!-- /container -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${contextPath}/resources/js/source.js"></script>
</body>
</html>
