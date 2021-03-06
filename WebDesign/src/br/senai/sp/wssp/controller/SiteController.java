package br.senai.sp.wssp.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import br.senai.sp.wssp.dao.SiteDao;
import br.senai.sp.wssp.modelo.Produto;
import br.senai.sp.wssp.modelo.Site;

@Controller
public class SiteController implements ServletContextAware {
	private ServletContext servletContext;
	@Autowired
	private SiteDao dao;

	@RequestMapping("criarSite")
	public String criarSite(Site site, MultipartFile fileLogo,
			HttpSession session) {
		int idSite;
		String path = "/imagens/" + site.getTitulo();
		try {
			File pasta = new File(servletContext.getRealPath(path));
			if (!pasta.exists()) {
				pasta.mkdir();
			}
			path = path + "/" + fileLogo.getOriginalFilename();
			site.setLogo(path);
			if (site.getId() == 0) {
				idSite = dao.criarSite(site);
				site.setId(idSite);
			} else {
				dao.atualizaSite(site);
			}

			if (!fileLogo.isEmpty()) {
				byte[] bytes = fileLogo.getBytes();
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(new File(
								servletContext.getRealPath(path))));
				stream.write(bytes);
				stream.close();
			}

		} catch (Exception e) {
			throw new RuntimeException(e);
		}

		session.setAttribute("siteAdmin", site);
		return "forward:menu";
	}

	@RequestMapping("criarMenu")
	public String criarMenu(String backColor, String fontColor, int id,
			HttpSession session) {
		dao.atualizaMenu(id, backColor, fontColor);
		Site siteAdmin = (Site) session.getAttribute("siteAdmin");
		siteAdmin.setBack_menu(backColor);
		siteAdmin.setFonte_menu(fontColor);
		session.setAttribute("siteAdmin", siteAdmin);
		return "forward:slide";
	}

	@Override
	public void setServletContext(ServletContext context) {
		this.servletContext = context;
	}

	@RequestMapping("uploadSlide")
	public String uploadSlide(@RequestParam("files") MultipartFile[] files,
			HttpSession session) {
		List<String> imagens = new ArrayList<String>();
		Site site = (Site) session.getAttribute("siteAdmin");
		String path = "/imagens/" + site.getTitulo() + "/slide";
		try {
			File pasta = new File(servletContext.getRealPath(path));
			if (!pasta.exists()) {
				pasta.mkdir();
			}
			for (MultipartFile file : files) {
				String nome = file.getOriginalFilename();
				String imagem = path + "/" + nome;
				byte[] bytes = file.getBytes();
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(new File(
								servletContext.getRealPath(imagem))));
				stream.write(bytes);
				stream.close();
				imagens.add(imagem);
			}
			dao.salvarSlide(imagens, site);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return "forward:destaques";
	}

	@RequestMapping("excluirSlide")
	public void excluirSlide(Integer idSlide, String caminho,
			HttpServletResponse response) {
		try {
			File arquivo = new File(servletContext.getRealPath(caminho));
			if (arquivo.exists()) {
				arquivo.delete();
			}
			dao.excluirFotoSlide(idSlide);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		response.setStatus(200);
	}

	@RequestMapping("defineDestaques")
	public String defineDestaques(String backColor, String fontColor, int id,
			HttpSession session,
			@RequestParam("imagens") MultipartFile[] imagens) {
		Site siteAdmin = (Site) session.getAttribute("siteAdmin");
		String path = "/imagens/" + siteAdmin.getTitulo() + "/destaque";
		List<String> paths = new ArrayList<String>();
		try {
			File pasta = new File(servletContext.getRealPath(path));
			if (!pasta.exists()) {
				pasta.mkdir();
			}
			for (MultipartFile imagem : imagens) {
				String nome = imagem.getOriginalFilename();
				String pathImagem = path + "/" + nome;
				byte[] bytes = imagem.getBytes();
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(new File(
								servletContext.getRealPath(pathImagem))));
				stream.write(bytes);
				stream.close();
				paths.add(pathImagem);
			}
			dao.definirDestaques(backColor, fontColor, paths, id);
			siteAdmin.setBack_chamada(backColor);
			siteAdmin.setFonte_chamada(fontColor);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return "forward:cadprodutos";
	}

	@RequestMapping("defineRodape")
	public String defineRodape(String backColor, String fontColor,
			String backColor2, String fontColor2, String telefone,
			String email, int id, HttpSession session) {
		Site siteAdmin = (Site) session.getAttribute("siteAdmin");
		siteAdmin.setBack_rodape(backColor);
		siteAdmin.setFonte_rodape(fontColor);
		siteAdmin.setBack_rodape2(backColor2);
		siteAdmin.setFonte_rodape2(fontColor2);
		siteAdmin.setTelefone(telefone);
		siteAdmin.setEmail(email);
		dao.defineRodape(siteAdmin);
		return "forward:admin";
	}

	@RequestMapping(value = "cadastraProduto")
	public @ResponseBody String cadProduto(Produto produto,
			@RequestParam("idSite") Long idSite, MultipartFile imagem,
			HttpSession session) {
		System.out.println(produto.isDestaque());
		Charset charset = Charset.forName("UTF-8");
		produto.setDescricao(new String(produto.getDescricao().getBytes(),
				charset));
		int retorno;
		Site siteAdmin = (Site) session.getAttribute("siteAdmin");
		String path = "/imagens/" + siteAdmin.getTitulo() + "/produtos";
		try {
			File pasta = new File(servletContext.getRealPath(path));
			if (!pasta.exists()) {
				pasta.mkdir();
			}
			path = path + "/" + imagem.getOriginalFilename();
			byte[] bytes = imagem.getBytes();
			produto.setFoto(path);
			BufferedOutputStream stream = new BufferedOutputStream(
					new FileOutputStream(new File(
							servletContext.getRealPath(path))));
			stream.write(bytes);
			stream.close();
			retorno = dao.cadastrarProduto(produto, idSite.intValue());
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

		return String.valueOf(retorno);
	}

	@RequestMapping("excluirProduto")
	public void excluirProduto(Integer idProduto, HttpServletResponse response) {		
		String caminho = dao.buscarCaminhoProduto(idProduto);

		try {
			File arquivo = new File(servletContext.getRealPath(caminho));
			if (arquivo.exists()) {
				arquivo.delete();
			}
			dao.excluirProduto(idProduto);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		response.setStatus(200);
	}
	
	@RequestMapping("excluirSite")
	public void excluirSite(int id, String titulo, HttpServletResponse response){
		String path = "/imagens/" +titulo;
		try {
			File pasta = new File(servletContext.getRealPath(path));
			if (pasta.exists()) {				
				FileUtils.deleteDirectory(pasta);
			}
			dao.excluirSite(id);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		response.setStatus(200);
	}

}
