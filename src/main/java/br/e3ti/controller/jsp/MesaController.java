package br.e3ti.controller.jsp;

import java.security.Principal;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.e3ti.model.Mesa;
import br.e3ti.repository.MesaRepository;

@Controller
@RequestMapping("mesa")
public class MesaController {

	@Autowired
	public MesaRepository mesaRepository;

	@RequestMapping
	public String listarRegras(Model model, Principal principal) {
		model.addAttribute("mesas", mesaRepository.findAll());
		return "pages/mesa/mesa";
	}

	@RequestMapping(value = { "salvar", "editar" }, method = RequestMethod.POST)
	public String salvar(Mesa mesa) {
		mesaRepository.save(mesa);
		return "redirect:/mesa";
	}

	@RequestMapping("excluir")
	public String excluir(Mesa mesa, HttpServletResponse response) {
		mesaRepository.delete(mesa.getId());
		response.setStatus(200);
		return "redirect:/mesa";
	}

	@RequestMapping("{id}")
	public String retornaregraPorId(Model model, @PathVariable(value = "id") Long id) {
		model.addAttribute("mesa", mesaRepository.findById(id));
		return "pages/mesa/mesa";
	}

}
