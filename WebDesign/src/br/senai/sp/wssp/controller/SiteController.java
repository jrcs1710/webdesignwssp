package br.senai.sp.wssp.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URISyntaxException;

import org.apache.tomcat.util.net.URL;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import br.senai.sp.wssp.modelo.Site;

@Controller
public class SiteController {
	private static final String URLFILE = "//127.0.0.1/Files/";

	@RequestMapping("criarSite")
	public String criarSite(Site site, MultipartFile fileLogo) {
		String path = URLFILE + site.getTitulo();
		try {			
			File pasta = new File(path);
			if (!pasta.exists()) {
				pasta.mkdir();
			}
			if (!fileLogo.isEmpty()) {
				byte[] bytes = fileLogo.getBytes();
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(path+"/logo_"+site.getTitulo()+".jpg")));
				stream.write(bytes);
				stream.close();
			}
			
		} catch (Exception e) {
			throw new RuntimeException(e);
		}		
		return null;
	}
}
