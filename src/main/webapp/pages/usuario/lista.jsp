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
		<button class="btn btn-default btn-sm" data-toggle="modal"
			data-target="#novoUsuario" type="submit">Novo Usuário</button>
		<table class="table table-striped">
			<tr>
				<th>ID</th>
				<th>Foto</th>
				<th>Nome</th>
				<th>Usuario</th>
				<th>E-Mail</th>
				<th>Telefone</th>
				<th>Permissões</th>
				<th>Ativo</th>
			</tr>
			<c:forEach items="${usuarios}" var="usuario" varStatus="f">
				<tr class="${(!usuario.isAtivo) ? ('disabled') : ('')}">
					<td>${usuario.id}</td>
					<td>
						<figure>
							<img src="${usuario.avatar}" />
						</figure>
					</td>
					<td onmouseover="this.style.cursor='pointer'"
						onclick="window.location ='/usuario/${usuario.id}'">${usuario.name}</td>
					<td>${usuario.username}</td>
					<td>${usuario.email}</td>
					<td>${usuario.phone}</td>
					<td><c:forEach items="${usuario.roles}" var="role">
							<ul>
								<li>${role.name}</li>
							</ul>
						</c:forEach></td>
					<td><a
						style="${(!usuario.isAtivo) ? ('display:none;') : ('')}" href="#"
						onclick="alterarStatus(${usuario.id}, 'usuario');">Desativar</a>
						<a
						style="${(usuario.isAtivo) ? ('display:none;') : ('')}" href="#"
						onclick="alterarStatus(${usuario.id}, 'usuario');">Ativar</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<!-- /container -->
	<div class="modal fade" id="novoUsuario" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">Novo Usuário</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<form id="formUsurLogado" action="/usuario/editar" method="POST"
						class="form-signin">
						<span>${message}</span> <input name="username" type="text"
							class="form-control form-group" placeholder="Login"
							autofocus="true" /> <input name="name" type="text"
							class="form-control form-group" placeholder="Nome de Usuário"
							autofocus="true" /> <input name="email" type="text"
							class="form-control form-group" placeholder="E-mail"
							autofocus="true" /> <input name="phone" type="text"
							class="form-control form-group" placeholder="Telefone"
							autofocus="true" /> <input name="avatar" type="text"
							class="form-control form-group" placeholder="Avatar"
							autofocus="true" /> <span>${error}</span> <input type="password"
							class="form-control form-group" name="password"
							placeholder="Senha" /> <input type="password"
							class="form-control form-group" name="passwordConfirm"
							placeholder="Confirme a senha" /><input type="hidden" name="id" />
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
						<div class="modal-footer">
							<button class="btn btn-default" data-dismiss="modal">Fechar</button>
							<input type="submit" class="btn btn-primary" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${contextPath}/resources/js/source.js"></script>
</body>
</html>
