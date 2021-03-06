package br.e3ti.controller.jsp;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.e3ti.model.Atividade;
import br.e3ti.repository.AtividadeRepository;

@Controller
@RequestMapping("atividade")
public class AtividadeController {
	
	@Autowired
	public AtividadeRepository atividadeRepository;
	
	@RequestMapping
	public String listarTodas(Model model){
		model.addAttribute("atividades", atividadeRepository.findAll());
		return "pages/atividade/lista";
	}
	
	@RequestMapping(value={"salvar","editar"}, method=RequestMethod.POST)
	public String salvar(@Valid Atividade atividade){	
		atividadeRepository.save(atividade);
		return "redirect:/lista";
	}
	
	@RequestMapping("excluir")
	public String excluir(Atividade atividade, HttpServletResponse response){
		atividadeRepository.delete(atividade.getId());
		response.setStatus(200);
		return "redirect:/lista";
	}
	
}
