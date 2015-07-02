package br.senai.sp.wssp.controller;

import java.util.List;

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
	public String admin(Model model, HttpSession session) {
		session.invalidate();
		List<Site> sites = dao.listar();
		model.addAttribute("listaSites", sites);
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
	public String destaques(){
		return "admin/destaques";
	}
	
	@RequestMapping("rodape")
	public String rodape(){
		return "admin/rodape";
	}
	
	@RequestMapping("cadprodutos")
	public String cadProdutos(HttpSession session, Model model){
		Site siteAdmin = (Site) session.getAttribute("siteAdmin");
		if (siteAdmin != null) {
			model.addAttribute("produtos", dao.buscarProdutos(siteAdmin.getId()));
		}
		return "admin/cadproduto";
	}
	
	@RequestMapping("alterarSite")
	public String alterarSite(int id, HttpSession session){
		Site site =  dao.buscar(id);
		session.setAttribute("siteAdmin", site);
		return "admin/novo";
	}

}
