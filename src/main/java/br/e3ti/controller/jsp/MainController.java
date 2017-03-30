package br.e3ti.controller.jsp;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.e3ti.repository.UserRepository;

@Controller
@RequestMapping
public class MainController {

	@Autowired
	UserRepository userRepository;

	@RequestMapping(value = { "/", "/home" }, method = RequestMethod.GET)
	public String home(Model model, Principal principal) {
		model.addAttribute("usuarioLogado", userRepository.findByUsername(principal.getName()));
		return "pages/home";
	}
	
}
