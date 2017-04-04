package br.e3ti.controller.jsp;

import java.security.Principal;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.e3ti.model.Produto;
import br.e3ti.repository.ProdutoRepository;

@Controller
@RequestMapping("produto")
public class ProdutoController {

	@Autowired
	public ProdutoRepository produtoRepository;

	@RequestMapping
	public String listarRegras(Model model, Principal principal) {
		model.addAttribute("produtos", produtoRepository.findAll());
		return "pages/produto/produto";
	}

	@RequestMapping(value = { "salvar", "editar" }, method = RequestMethod.POST)
	public String salvar(Produto produto) {
		produtoRepository.save(produto);
		return "redirect:/produto";
	}

	@RequestMapping("excluir")
	public String excluir(Produto produto, HttpServletResponse response) {
		produtoRepository.delete(produto.getId());
		response.setStatus(200);
		return "redirect:/produto";
	}

	@RequestMapping("{id}")
	public String retornaregraPorId(Model model, @PathVariable(value = "id") Long id) {
		model.addAttribute("produto", produtoRepository.findById(id));
		return "pages/produto/produto";
	}

}
