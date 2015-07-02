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

import com.sun.org.apache.regexp.internal.RESyntaxException;

import br.senai.sp.wssp.modelo.FotoSlide;
import br.senai.sp.wssp.modelo.Produto;
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
		String sql = "UPDATE site SET titulo = ?, layout = ?, logo = ? WHERE id = ?";
		try {
			PreparedStatement stmt = conexao.prepareStatement(sql);
			stmt.setString(1, site.getTitulo());
			stmt.setByte(2, site.getLayout());
			stmt.setString(3, site.getLogo());
			stmt.setInt(4, site.getId());
			stmt.execute();
			stmt.close();
		} catch (Exception e) {
			throw new RuntimeException(e);
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
				site.setId(rs.getInt("id"));
				site.setTitulo(rs.getString("titulo"));
				site.setLayout(rs.getByte("layout"));
				site.setLogo(rs.getString("logo"));
				site.setBack_menu(rs.getString("back_menu"));
				site.setFonte_menu(rs.getString("fonte_menu"));
				site.setBack_rodape(rs.getString("back_rodape"));
				site.setFonte_rodape(rs.getString("fonte_rodape"));
				site.setFoto_empresa(rs.getString("foto_empresa"));
				site.setFoto_produto(rs.getString("foto_produto"));
				site.setFoto_cliente(rs.getString("foto_cliente"));
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
	
	public Site buscar(int id) {
		Site site = null;
		String sql = "SELECT * FROM view_site WHERE id = ?";
		try {
			PreparedStatement stmt = conexao.prepareStatement(sql);
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				site = new Site();
				site.setId(rs.getInt("id"));
				site.setTitulo(rs.getString("titulo"));
				site.setLayout(rs.getByte("layout"));
				site.setLogo(rs.getString("logo"));
				site.setBack_menu(rs.getString("back_menu"));
				site.setFonte_menu(rs.getString("fonte_menu"));
				site.setBack_rodape(rs.getString("back_rodape"));
				site.setFonte_rodape(rs.getString("fonte_rodape"));
				site.setFoto_empresa(rs.getString("foto_empresa"));
				site.setFoto_produto(rs.getString("foto_produto"));
				site.setFoto_cliente(rs.getString("foto_cliente"));
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

	public List<Site> listar() {
		List<Site> lista = new ArrayList<Site>();
		String sql = "SELECT * FROM site ORDER BY ID DESC LIMIT 30";
		try {
			PreparedStatement stmt = conexao.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Site site = new Site();
				site.setId(rs.getInt("id"));
				site.setTitulo(rs.getString("titulo"));
				site.setLayout(rs.getByte("layout"));
				site.setBack_menu(rs.getString("back_menu"));
				site.setFonte_menu(rs.getString("fonte_menu"));
				lista.add(site);
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return lista;
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

	public void excluirFotoSlide(int id) {
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

	public void definirDestaques(String backColor, String fontColor,
			List<String> imagens, int id) {
		String sql = "UPDATE site SET back_chamada = ?, fonte_chamada = ?, foto_empresa = ?, foto_produto = ?, foto_cliente = ? WHERE id = ?";
		try {
			PreparedStatement stmt = conexao.prepareStatement(sql);
			stmt.setString(1, backColor);
			stmt.setString(2, fontColor);
			stmt.setString(3, imagens.get(0));
			stmt.setString(4, imagens.get(1));
			stmt.setString(5, imagens.get(2));
			stmt.setInt(6, id);
			stmt.execute();
			stmt.close();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public int cadastrarProduto(Produto produto, int idSite) {
		int retorno = 0;
		String sql = "INSERT INTO produto(id_site, descricao, foto, destaque) VALUES(?,?,?,?)";
		try {
			PreparedStatement stmt = conexao.prepareStatement(sql,
					Statement.RETURN_GENERATED_KEYS);
			stmt.setInt(1, idSite);
			stmt.setString(2, produto.getDescricao());
			stmt.setString(3, produto.getFoto());
			stmt.setBoolean(4, produto.isDestaque());
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

	public List<Produto> buscarProdutos(int idSite) {
		List<Produto> lista = new ArrayList<Produto>();
		String sql = "SELECT * FROM produto WHERE id_site = ?";
		try {
			PreparedStatement stmt = conexao.prepareStatement(sql);
			stmt.setInt(1, idSite);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Produto p = new Produto();
				p.setDescricao(rs.getString("descricao"));
				p.setDestaque(rs.getBoolean("destaque"));
				p.setFoto(rs.getString("foto"));
				lista.add(p);
			}
			rs.close();
			stmt.close();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return lista;
	}

	public List<Produto> buscarProdutosDestaque(int idSite) {
		List<Produto> lista = new ArrayList<Produto>();
		String sql = "SELECT * FROM produto WHERE id_site = ? AND destaque = ? ORDER BY ID DESC LIMIT 4";
		try {
			PreparedStatement stmt = conexao.prepareStatement(sql);
			stmt.setInt(1, idSite);
			stmt.setBoolean(2, true);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Produto p = new Produto();
				p.setId(rs.getInt("id"));
				p.setDescricao(rs.getString("descricao"));
				p.setDestaque(rs.getBoolean("destaque"));
				p.setFoto(rs.getString("foto"));
				lista.add(p);
			}
			rs.close();
			stmt.close();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return lista;
	}

	public void excluirProduto(int idProduto) {
		String sql = "DELETE FROM produto WHERE id = ?";
		try {
			PreparedStatement stmt = conexao.prepareStatement(sql);
			stmt.setInt(1, idProduto);
			stmt.execute();
			stmt.close();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public String buscarCaminhoProduto(int idProduto) {
		String retorno = null;
		String sql = "SELECT foto FROM produto WHERE id = ?";
		try {
			PreparedStatement stmt = conexao.prepareStatement(sql);
			stmt.setInt(1, idProduto);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				retorno = rs.getString("foto");
			}
			rs.close();
			stmt.close();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return retorno;
	}

	public void defineRodape(Site site) {
		String sql = "UPDATE site SET back_rodape = ?, fonte_rodape = ?, back_rodape2 = ?, fonte_rodape2 = ?, telefone = ?, email = ? WHERE id = ?";
		try {
			PreparedStatement stmt = conexao.prepareStatement(sql);
			stmt.setString(1, site.getBack_rodape());
			stmt.setString(2, site.getFonte_rodape());
			stmt.setString(3, site.getBack_rodape2());
			stmt.setString(4, site.getFonte_rodape2());
			stmt.setString(5, site.getTelefone());
			stmt.setString(6, site.getEmail());
			stmt.setInt(7, site.getId());
			stmt.execute();
			stmt.close();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	public void excluirSite(int id){
		String sql = "DELETE FROM site WHERE id = ?";
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
