package br.senai.sp.wssp.controller;

import java.util.List;
import java.util.PrimitiveIterator.OfDouble;

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
		session.setAttribute("titulo", titulo);

		if (site != null && site.getLayout() == 2) {
			return "layout2/index";
		} else {
			return "layout1/index";
		}
	}

	@RequestMapping("clientes")
	public String clientes(HttpSession session) {
		Site site = (Site) session.getAttribute("site");
		if (site != null && site.getLayout() == 2) {
			return "layout2/clientes";
		} else {
			return "layout1/clientes";
		}
	}
	
	@RequestMapping("empresa")
	public String empresa(HttpSession session) {
		Site site = (Site) session.getAttribute("site");
		if (site != null && site.getLayout() == 2) {
			return "layout2/empresa";
		} else {
			return "layout1/empresa";
		}
	}
	
	@RequestMapping("localizacao")
	public String localizacao(HttpSession session) {
		Site site = (Site) session.getAttribute("site");
		if (site != null && site.getLayout() == 2) {
			return "layout2/localizacao";
		} else {
			return "layout1/localizacao";
		}
	}
	
	@RequestMapping("produtos")
	public String produtos(HttpSession session) {
		Site site = (Site) session.getAttribute("site");
		if (site != null) {
			List<Produto> produtos = dao.buscarProdutos(site.getId());	
			session.setAttribute("produtosSite", produtos);
		}		
		if (site != null && site.getLayout() == 2) {
			return "layout2/produtos";
		} else {
			return "layout1/produtos";
		}
	}
	
}
