package br.e3ti.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.e3ti.repository.UserRepository;

@Controller
public class UserController {
	
	@Autowired
	private UserRepository userRepository;
	
	@RequestMapping("usuario")
	public String listaUsuarios(Model model){
		model.addAttribute("usuarios", userRepository.findAll());
		model.addAttribute("usuario.roles");
		return "pages/usuario";
	}

}
