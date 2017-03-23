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
					<form id="formUsurLogado" action="/usuario/editar" method="POST"
						class="form-signin">
						<span>${message}</span> <input name="username" type="text"
							value="${usuario.username} ${i}" class="form-control"
							placeholder="Login" autofocus="true" disabled /> <input
							name="name" type="text" value="${usuario.name}"
							class="form-control" placeholder="Nome de Usuário"
							autofocus="true" /> <input name="email" type="text"
							value="${usuario.email}" class="form-control"
							placeholder="E-mail" autofocus="true" /> <input name="phone"
							type="text" value="${usuario.phone}" class="form-control"
							placeholder="Telefone" autofocus="true" /> <input name="avatar"
							type="text" value="${usuario.avatar}" class="form-control"
							placeholder="Avatar" autofocus="true" /> <span>${error}</span> <input
							type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" /> <input type="hidden" name="password"
							value="${usuario.password}" /> <input type="hidden"
							name="id" value="${usuario.id}" /> <input type="hidden"
							name="username" value="${usuario.username}" />

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
<div class="modal fade" id="editarUsuario2" tabindex="-1" role="dialog"
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
					<form id="formUsurLogado" action="/usuario/editar" method="POST"
						class="form-signin">
						<span>${message}</span> <input name="username" type="text"
							value="${usuarioEditado.username} ${i}" class="form-control"
							placeholder="Login" autofocus="true" disabled /> <input
							name="name" type="text" value="${usuarioEditado.name}"
							class="form-control" placeholder="Nome de Usuário"
							autofocus="true" /> <input name="email" type="text"
							value="${usuarios[i].email}" class="form-control"
							placeholder="E-mail" autofocus="true" /> <input name="phone"
							type="text" value="${usuarios[i].phone}" class="form-control"
							placeholder="Telefone" autofocus="true" /> <input name="avatar"
							type="text" value="${usuarios[i].avatar}" class="form-control"
							placeholder="Avatar" autofocus="true" /> <span>${error}</span> <input
							type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" /> <input type="hidden" name="password"
							value="${usuarios[i].password}" /> <input type="hidden"
							name="id" value="${usuarios[i].id}" /> <input type="hidden"
							name="username" value="${usuarios[i].username}" />

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