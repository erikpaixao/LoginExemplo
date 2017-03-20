package br.e3ti.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import br.e3ti.repository.RoleRepository;

@Controller
public class RoleController {
	
	@Autowired
	public RoleRepository roleRepository;
}
