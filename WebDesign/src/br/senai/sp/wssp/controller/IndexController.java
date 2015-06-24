package br.senai.sp.wssp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.senai.sp.wssp.dao.SiteDao;
import br.senai.sp.wssp.modelo.Site;

@Controller
public class IndexController {
	@Autowired
	private SiteDao dao;

	@RequestMapping("index")
	public String index(String titulo, Model model) {
		Site site = dao.buscar(titulo);
		model.addAttribute("site", site);
		if (site.getLayout() == '1') {
			return "layout1";
		} else {
			return "layout2";
		}
	}
}
