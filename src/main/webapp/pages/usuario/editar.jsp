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
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
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
			data-target="#adicionarAtividade" type="submit">Adicionar
			Atividade</button>
		<table class="table table-striped">
			<tr>
				<th>ID</th>
				<th>Foto</th>
				<th>Nome</th>
				<th>Usuario</th>
				<th>E-Mail</th>
				<th>Telefone</th>
				<th>Permissões</th>
				<th>Opções</th>
			</tr>
			<tr>
				<td>${usuario.id}</td>
				<td>
					<figure>
						<img src="${usuario.avatar}" />
					</figure>
				</td>
				<td>${usuario.name}</td>
				<td>${usuario.username}</td>
				<td>${usuario.email}</td>
				<td>${usuario.phone}</td>
				<td><c:forEach items="${usuario.roles}" var="role">
						<ul>
							<li>${role.name}</li>
						</ul>
					</c:forEach></td>
				<td><a href="#" data-toggle="modal"
					data-target="#editarUsuario">Editar</a> <a href="#"
					onclick="excluir(${usuario.id}, 'usuario');">Excluir</a></td>
			</tr>
		</table>
		<div class=header>
			<h3>Atividades</h3>
		</div>
		<table class="table table-striped">
			<tr>
				<th>ID</th>
				<th>Tipo</th>
				<th>Descrição</th>
				<th>Criação</th>
				<th>Prazo Final</th>
				<th>Delegado</th>
				<th>Opções</th>
			</tr>
			<c:forEach items="${usuario.atividadesDoMes}" var="atividade"
				varStatus="f">
				<tr>
					<td>${atividade.id}</td>
					<td onmouseover="this.style.cursor='pointer'"
						onclick="window.location ='/usuario/${atividade.id}'">${atividade.tipoAtividade}</td>
					<td>${atividade.descricao}</td>
					<td><fmt:formatDate value="${atividade.dataCriacao}"
							pattern="dd/MM/yy" /></td>
					<td><fmt:formatDate value="${atividade.prazoFinal}"
							pattern="dd/MM/yy" /></td>
					<td>${atividade.usuario.name}</td>
					<td><a href="#" onclick="excluirUsuario(${atividade.id});">Excluir</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<!-- /container -->
	<div class="modal fade" id="editarUsuario" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<form id="formUsurLogado" action="editar" method="POST"
							class="form-signin">
							<span>${message}</span> <input name="username" type="text"
								value="${usuario.username} ${i}" class="form-control"
								placeholder="Login" autofocus="true" /> <input
								name="name" type="text" value="${usuario.name}"
								class="form-control" placeholder="Nome de Usuário"
								autofocus="true" /> <input name="email" type="text"
								value="${usuario.email}" class="form-control"
								placeholder="E-mail" autofocus="true" /> <input name="phone"
								type="text" value="${usuario.phone}" class="form-control"
								placeholder="Telefone" autofocus="true" />
							<c:forEach items="${usuario.roles}" var="role2">
								<c:forEach items="${roles}" var="role">
									<input type="checkbox" name="roles" value="${role.id}"
										${role.id == role2.id ? "checked" : " " }>${role.name}</input>
								</c:forEach>
							</c:forEach>
							<input name="avatar" type="text" value="${usuario.avatar}"
								class="form-control" placeholder="Avatar" autofocus="true" /> <span>${error}</span>
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" /> <input type="hidden" name="password"
								value="${usuario.password}" /> <input type="hidden" name="id"
								value="${usuario.id}" /> <input type="hidden" name="username"
								value="${usuario.username}" />

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

	<div class="modal fade" id="adicionarAtividade" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<form id="formUsurLogado" action="/atividade/editar" method="POST"
							class="form-signin">
							<span>${message}</span> <input name="descricao" type="text"
								value="" class="form-control" placeholder="Descrição"
								autofocus="true" /> <input name="dataCriacao"
								type="text" class="form-control" placeholder="Data de Criação"
								autofocus="true" /> <input name="prazoFinal" id="" type="text"
								class="form-control" placeholder="Data de Finalização"
								autofocus="true" /> <input name="isRealizado" type="checkbox"
								class="form-control" autofocus="true" /> <input type="hidden"
								name="${_csrf.parameterName}" value="${_csrf.token}" /> <input
								type="hidden" name="usuario" value="${usuario.id}" />

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
