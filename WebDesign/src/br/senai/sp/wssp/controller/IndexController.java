package br.senai.sp.wssp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import br.senai.sp.wssp.dao.SiteDao;
import br.senai.sp.wssp.modelo.Produto;
import br.senai.sp.wssp.modelo.Site;

@Controller
public class IndexController {
	@Autowired
	private SiteDao dao;

	@RequestMapping("index/{titulo}")
	public String index(@PathVariable(value = "titulo") String titulo,
			Model model, HttpSession session) {
		Site site = dao.buscar(titulo);
		if (site != null) {
			List<Produto> produtos = dao.buscarProdutosDestaque(site.getId());
			model.addAttribute("produtosDestaque", produtos);
		}		
		session.setAttribute("site", site);
		
		if (site != null && site.getLayout() == 2) {
			return "layout2/index";
		} else {
			return "layout1/index";
		}
	}
}
