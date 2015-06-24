package br.senai.sp.wssp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.senai.sp.wssp.modelo.Site;



@Repository
public class SiteDao {
	private Connection conexao;
	
	@Autowired
	public SiteDao(DataSource dataSource){
		try {
			this.conexao = dataSource.getConnection();			
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	public void criarSite(Site site){
		String sql = "INSERT INTO site(titulo,layout,logo) VALUES (?,?,?)";
		try {
			PreparedStatement stmt = conexao.prepareStatement(sql);
			stmt.setString(1, site.getTitulo());
			stmt.setString(2, String.valueOf(site.getLayout()));
			stmt.setString(3, site.getLogo());
			stmt.execute();
			stmt.close();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	public Site buscar(String titulo){
		Site site = null;
		String sql = "SELECT * FROM view_site WHERE titulo = ?";
		try {
			PreparedStatement stmt = conexao.prepareStatement(sql);
			stmt.setString(1, titulo);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				site = new Site();
				site.setTitulo(rs.getString("titulo"));
				site.setLayout(rs.getString("layout").charAt(0));
				site.setLogo(rs.getString("logo"));
				site.setBack_menu(rs.getString("back_menu"));
				site.setFonte_menu(rs.getString("fonte_menu"));
				site.setBack_rodape(rs.getString("back_rodape"));
				site.setFonte_rodape(rs.getString("fonte_rodape"));
				site.setFoto_empresa(rs.getString("foto_empresa"));
				site.setFoto_produto(rs.getString("foto_produto"));
				site.setFoto_galeria(rs.getString("foto_galeria"));
				site.setFonte_chamada(rs.getString("fonte_chamada"));
				site.setBack_chamada(rs.getString("back_chamada"));
				site.setTelefone(rs.getString("telefone"));
				site.setEmail(rs.getString("email"));
				site.setBack_rodape2(rs.getString("back_rodape2"));
				site.setFonte_rodape2(rs.getString("fonte_rodape2"));
				String caminho = rs.getString("caminho");
				if (caminho != null) {
					site.setFotos_slide(new ArrayList<String>());
					site.getFotos_slide().add(caminho);
					while (rs.next()) {												
						site.getFotos_slide().add(rs.getString(caminho));
					}
				}
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return site;
	}	
}
