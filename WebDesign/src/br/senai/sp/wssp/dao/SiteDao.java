package br.senai.sp.wssp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

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
}
