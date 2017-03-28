package br.e3ti.controller.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.e3ti.model.User;
import br.e3ti.repository.UserRepository;

@RestController
@RequestMapping("/api/usuario")
public class UserRestController {
	
	@Autowired
	UserRepository userRepository;
	
	@RequestMapping
	public List<User> listarTodos(){
		return userRepository.findAll();
	}
	
	@RequestMapping("{id}")
	public User buscaPorId(@PathVariable(value="id") Long id){
		return userRepository.findById(id);
	}
	
}
