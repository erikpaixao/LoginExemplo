package br.e3ti.controller;

import java.security.Principal;
import java.util.HashSet;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.e3ti.model.User;
import br.e3ti.repository.RoleRepository;
import br.e3ti.repository.UserRepository;

@Controller
@RequestMapping("usuario")
public class UserController {
	
	@Autowired
	private UserRepository userRepository;
	
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    
    @Autowired
    private RoleRepository roleRepository;
	
	@RequestMapping
	public String listaUsuarios(Model model, Principal principal){
		
		model.addAttribute("usuarios", userRepository.findAll());
		//model.addAttribute("usuarioLogado", userRepository.findByUsername(principal.getName()));
		return "pages/usuario";
	}
	
	@RequestMapping(value={"salvar","editar"}, method=RequestMethod.POST)
	public String salvar(@Valid User user){	
		if(user.getId() == null){
			user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		}
        user.setRoles(new HashSet<>(roleRepository.findAll()));
        userRepository.save(user);
		return "redirect:/usuario";
	}
	
	@RequestMapping("excluir")
	public String excluir(User user, HttpServletResponse response){
		userRepository.delete(user.getId());
		response.setStatus(200);
		return "redirect:/usuario";
	}
	
	@RequestMapping("{id}")
	public String retornaUsuarioPorId(Model model, @PathVariable(value="id") Long id){
		model.addAttribute("usuario", userRepository.findById(id));
		return "pages/editar";
	}

}
