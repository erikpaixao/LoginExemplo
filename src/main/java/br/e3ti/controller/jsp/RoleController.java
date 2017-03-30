package br.e3ti.controller.jsp;

import java.security.Principal;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.e3ti.model.Role;
import br.e3ti.repository.RoleRepository;

@Controller
@RequestMapping("regra")
public class RoleController {
	
	@Autowired
	public RoleRepository roleRepository;
	
	@RequestMapping
	public String listarRegras(Model model, Principal principal){
		model.addAttribute("regras", roleRepository.findAll());
		return "pages/regra/regra";
	}
	
	@RequestMapping(value={"salvar","editar"}, method=RequestMethod.POST)
	public String salvar( Role role){	
        roleRepository.save(role);
		return "redirect:/regra";
	}
	
	@RequestMapping("excluir")
	public String excluir(Role role, HttpServletResponse response){
		roleRepository.delete(role.getId());
		response.setStatus(200);
		return "redirect:/regra";
	}
	
	@RequestMapping("{id}")
	public String retornaregraPorId(Model model, @PathVariable(value="id") Long id){
		model.addAttribute("regra", roleRepository.findById(id));
		return "pages/regra/editar";
	}

}
