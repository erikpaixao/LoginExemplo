package br.e3ti.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.e3ti.repository.AtividadeRepository;

@Controller
@RequestMapping("atividade")
public class AtividadeController {
	
	@Autowired
	public AtividadeRepository atividadeRepository;
}
