package br.e3ti.controller;

import java.security.Principal;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.e3ti.model.User;
import br.e3ti.repository.UserRepository;

@Controller
@RequestMapping("usuario")
public class UserController {
	
	@Autowired
	private UserRepository userRepository;
	
	@RequestMapping
	public String listaUsuarios(Model model, Principal principal){
		
		model.addAttribute("usuarios", userRepository.findAll());
		model.addAttribute("usuario.roles");
		model.addAttribute("usuarioLogado", userRepository.findByUsername(principal.getName()));
		
		return "pages/usuario";
	}
	
	@RequestMapping(value = {"editar", "salvar"})
	public String salvar(@Valid User user){		
		userRepository.save(user);
		return "redirect:/usuario";
	}
	
	@RequestMapping("excluir")
	public String excluir(User user){
		userRepository.delete(user.getId());
		return "redirect:/usuario";
	}

}
