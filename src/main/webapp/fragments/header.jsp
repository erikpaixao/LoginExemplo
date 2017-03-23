
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<form id="logoutForm" method="POST" action="${contextPath}/logout">
	<input type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" />
</form>
<nav class="navbar navbar-default">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="${contextPath}">Brand</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="/usuario" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Usuarios <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#" data-toggle="modal"
							data-target="#novoUsuario">Novo Usuário...</a></li>
						<li><a href="#">Nova Regra</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">${pageContext.request.userPrincipal.name}<span
						class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#" data-toggle="modal"
							data-target="#editarUsuarioLogado">Editar</a></li>
						<li><a href="#">Configurações</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="#"
							onclick="document.forms['logoutForm'].submit()">Logout</a></li>
					</ul></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>
<!-- Modal -->
<div class="modal fade" id="editarUsuarioLogado" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">Editando
					${usuarioLogado.name}</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<form id="formUsurLogado" action="/usuario/editar" method="POST"
						class="form-signin">
						<span>${message}</span> <input name="username" type="text"
							value="${usuarioLogado.username}" class="form-control"
							placeholder="Login" autofocus="true" disabled /> <input
							name="name" type="text" value="${usuarioLogado.name}"
							class="form-control" placeholder="Nome de Usuário"
							autofocus="true" /> <input name="email" type="text"
							value="${usuarioLogado.email}" class="form-control"
							placeholder="E-mail" autofocus="true" /> <input name="phone"
							type="text" value="${usuarioLogado.phone}" class="form-control"
							placeholder="Telefone" autofocus="true" /> <input name="avatar"
							type="text" value="${usuarioLogado.avatar}" class="form-control"
							placeholder="Avatar" autofocus="true" /> <span>${error}</span> <input
							type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" /> <input type="hidden" name="password"
							value="${usuarioLogado.password}" /> <input type="hidden"
							name="id" value="${usuarioLogado.id}" /> <input type="hidden"
							name="username" value="${usuarioLogado.username}" />

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
<!-- Modal -->
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
						 class="form-control"
							placeholder="Login" autofocus="true" /> <input
							name="name" type="text" 
							class="form-control" placeholder="Nome de Usuário"
							autofocus="true" /> <input name="email" type="text"
							 class="form-control"
							placeholder="E-mail" autofocus="true" /> <input name="phone"
							type="text"  class="form-control"
							placeholder="Telefone" autofocus="true" /> <input name="avatar"
							type="text"  class="form-control"
							placeholder="Avatar" autofocus="true" /> <span>${error}</span> <input
							type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" /> <input type="password" name="password"
							 /> <input type="password" name="passwordConfirm"
							 /><input type="hidden"
							name="id" /> 

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