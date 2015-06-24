package br.senai.sp.wssp.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URISyntaxException;

import javax.servlet.ServletContext;

import org.apache.tomcat.util.net.URL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import br.senai.sp.wssp.dao.SiteDao;
import br.senai.sp.wssp.modelo.Site;

@Controller
public class SiteController implements ServletContextAware {
	private ServletContext servletContext;
	@Autowired
	private SiteDao dao;

	@RequestMapping("criarSite")
	public String criarSite(Site site, MultipartFile fileLogo) {
		String path = "/imagens/" + site.getTitulo();
		try {
			File pasta = new File(servletContext.getRealPath(path));
			if (!pasta.exists()) {
				pasta.mkdir();
			}
			path = path + "/logo_" + site.getTitulo() + ".jpg";
			site.setLogo(path);
			dao.criarSite(site);
			if (!fileLogo.isEmpty()) {
				byte[] bytes = fileLogo.getBytes();
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(new File(servletContext.getRealPath(path))));
				stream.write(bytes);
				stream.close();
			}

		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return null;
	}

	@Override
	public void setServletContext(ServletContext context) {
		this.servletContext = context;

	}
}
