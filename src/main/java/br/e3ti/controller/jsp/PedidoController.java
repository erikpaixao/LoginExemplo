package br.e3ti.controller.jsp;

import java.security.Principal;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.e3ti.model.Pedido;
import br.e3ti.repository.PedidoRepository;

@Controller
@RequestMapping("pedido")
public class PedidoController {

	@Autowired
	public PedidoRepository pedidoRepository;

	@RequestMapping
	public String listarRegras(Model model, Principal principal) {
		model.addAttribute("pedidos", pedidoRepository.findAll());
		return "pages/pedido/pedido";
	}

	@RequestMapping(value = { "salvar", "editar" }, method = RequestMethod.POST)
	public String salvar(Pedido pedido) {
		pedidoRepository.save(pedido);
		return "redirect:/pedido";
	}

	@RequestMapping("excluir")
	public String excluir(Pedido pedido, HttpServletResponse response) {
		pedidoRepository.delete(pedido.getId());
		response.setStatus(200);
		return "redirect:/pedido";
	}

	@RequestMapping("{id}")
	public String retornaregraPorId(Model model, @PathVariable(value = "id") Long id) {
		model.addAttribute("pedido", pedidoRepository.findById(id));
		return "pages/pedido/pedido";
	}

}
