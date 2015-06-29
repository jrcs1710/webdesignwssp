package br.senai.sp.wssp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.senai.sp.wssp.dao.SiteDao;
import br.senai.sp.wssp.modelo.Site;

@Controller
public class AdminController {
	@Autowired
	private SiteDao dao;

	@RequestMapping("admin")
	public String admin() {
		return "admin/admin";
	}

	@RequestMapping("novo")
	public String novo() {
		return "admin/novo";
	}

	@RequestMapping("menu")
	public String menu() {
		return "admin/menu";
	}

	@RequestMapping("slide")
	public String slide(HttpSession session, Model model) {
		Site siteAdmin = (Site) session.getAttribute("siteAdmin");
		if (siteAdmin != null) {
			model.addAttribute("fotos_slide", dao.buscarFotos(siteAdmin.getId()));	
		}		
		return "admin/slide";
	}
	
	@RequestMapping("destaques")
	public String paginicial(){
		return "admin/destaques";
	}
	
	@RequestMapping("cadprodutos")
	public String cadProdutos(){
		return "admin/cadproduto";
	}

}
