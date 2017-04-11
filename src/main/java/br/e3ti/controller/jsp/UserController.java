package br.e3ti.controller.jsp;

import java.security.Principal;
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
import br.e3ti.repository.AtividadeRepository;
import br.e3ti.repository.RoleRepository;
import br.e3ti.repository.UserRepository;

@Controller
@RequestMapping("usuario")
public class UserController {
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private RoleRepository roleRepository;
	
	@Autowired
	private AtividadeRepository atividadeRepository;
	
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@RequestMapping
	public String listaUsuarios(Model model, Principal principal){
		model.addAttribute("usuarios", userRepository.findAll());
		model.addAttribute("roles", roleRepository.findAll());
		return "pages/usuario/lista";
	}
	
	@RequestMapping(value={"salvar","editar"}, method=RequestMethod.POST)
	public String salvar(@Valid User user){	
		if(user.getId() == null){
			user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		}
        userRepository.save(user);
		return "redirect:/usuario";
	}
	
	@RequestMapping("alterarStatus")
	public String excluir(User user, HttpServletResponse response){
		User userUtil = userRepository.findById(user.getId());
		userUtil.setIsAtivo(!userUtil.getIsAtivo());
		userRepository.save(userUtil);
		response.setStatus(200);
		return "redirect:/usuario";
	}
	
	@RequestMapping("{id}")
	public String retornaUsuarioPorId(Model model, @PathVariable(value="id") Long id){
		model.addAttribute("usuario", userRepository.findById(id));
		model.addAttribute("roles", roleRepository.findAll());
		model.addAttribute("atividades", atividadeRepository.findAll());
		return "pages/usuario/editar";
	}

}
