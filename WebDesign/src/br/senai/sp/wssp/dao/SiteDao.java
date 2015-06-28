package br.senai.sp.wssp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.senai.sp.wssp.modelo.FotoSlide;
import br.senai.sp.wssp.modelo.Site;

@Repository
public class SiteDao {
	private Connection conexao;

	@Autowired
	public SiteDao(DataSource dataSource) {
		try {
			this.conexao = dataSource.getConnection();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public int criarSite(Site site) {
		int retorno = -1;
		String sql = "INSERT INTO site(titulo,layout,logo) VALUES (?,?,?)";
		try {
			PreparedStatement stmt = conexao.prepareStatement(sql,
					Statement.RETURN_GENERATED_KEYS);
			stmt.setString(1, site.getTitulo());
			stmt.setByte(2, site.getLayout());
			stmt.setString(3, site.getLogo());
			stmt.execute();
			ResultSet keys = stmt.getGeneratedKeys();
			if (keys.next()) {
				retorno = keys.getInt(1);
			}
			keys.close();
			stmt.close();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return retorno;
	}

	public void atualizaSite(Site site) {
		String sql = "UPDATE site SET tiulo = ?, layout = ?, logo = ? WHERE id = ?";
		try {
			PreparedStatement stmt = conexao.prepareStatement(sql);
			stmt.setString(1, site.getTitulo());
			stmt.setByte(2, site.getLayout());
			stmt.setString(3, site.getLogo());
			stmt.setInt(4, site.getId());
			stmt.execute();
			stmt.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public void atualizaMenu(int id, String backColor, String fontColor) {
		String sql = "UPDATE site SET back_menu = ?, fonte_menu = ? WHERE id = ?";
		try {
			PreparedStatement stmt = conexao.prepareStatement(sql);
			stmt.setString(1, backColor);
			stmt.setString(2, fontColor);
			stmt.setInt(3, id);
			stmt.execute();
			stmt.close();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public Site buscar(String titulo) {
		Site site = null;
		String sql = "SELECT * FROM view_site WHERE titulo = ?";
		try {
			PreparedStatement stmt = conexao.prepareStatement(sql);
			stmt.setString(1, titulo);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				site = new Site();
				site.setTitulo(rs.getString("titulo"));
				site.setLayout(rs.getByte("layout"));
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
					site.setFotos_slide(new ArrayList<FotoSlide>());
					FotoSlide fs = new FotoSlide();
					fs.setId(rs.getInt("id_foto"));
					fs.setCaminho(caminho);
					site.getFotos_slide().add(fs);
					while (rs.next()) {
						fs = new FotoSlide();
						fs.setId(rs.getInt("id_foto"));
						fs.setCaminho(rs.getString("caminho"));
						site.getFotos_slide().add(fs);
					}
				}
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return site;
	}

	public void salvarSlide(List<String> imagens, Site site) {
		String sql = "INSERT INTO foto_slide(id_site,caminho) VALUES (?,?)";
		try {
			conexao.setAutoCommit(false);
			PreparedStatement stmt = conexao.prepareStatement(sql);

			for (String string : imagens) {
				stmt.setInt(1, site.getId());
				stmt.setString(2, string);
				stmt.execute();
			}
			conexao.commit();
			stmt.close();
			conexao.setAutoCommit(true);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public List<FotoSlide> buscarFotos(int idSite) {
		String sql = "SELECT * FROM foto_slide WHERE id_site = ?";
		List<FotoSlide> lista = new ArrayList<FotoSlide>();
		try {
			PreparedStatement stmt = conexao.prepareStatement(sql);
			stmt.setInt(1, idSite);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {					
				FotoSlide fs = new FotoSlide();
				fs.setId(rs.getInt("id"));
				fs.setCaminho(rs.getString("caminho"));
				lista.add(fs);
			}
			stmt.close();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return lista;
	}
	
	public void excluirFotoSlide(int id){
		String sql = "DELETE FROM foto_slide WHERE id  = ?";
		try {
			PreparedStatement stmt = conexao.prepareStatement(sql);
			stmt.setInt(1, id);
			stmt.execute();
			stmt.close();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
