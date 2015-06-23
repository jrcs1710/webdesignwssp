package br.senai.sp.wssp.modelo;

import java.util.List;

public class Site {
	private int id;
	private String titulo;
	private String logo;
	private char layout;
	private String back_menu;
	private String fonte_menu;
	private String back_rodape;
	private String fonte_rodape;
	private String foto_empresa;
	private String foto_produto;
	private String foto_galeria;
	private String fonte_chamada;
	private String back_chamada;
	private String telefone;
	private String email;
	private String back_rodape2;
	private String fonte_rodape2;
	private List<String> fotos_slide;
	private List<Produto> produtos;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public char getLayout() {
		return layout;
	}

	public void setLayout(char layout) {
		this.layout = layout;
	}

	public String getBack_menu() {
		return back_menu;
	}

	public void setBack_menu(String back_menu) {
		this.back_menu = back_menu;
	}

	public String getFonte_menu() {
		return fonte_menu;
	}

	public void setFonte_menu(String fonte_menu) {
		this.fonte_menu = fonte_menu;
	}

	public String getBack_rodape() {
		return back_rodape;
	}

	public void setBack_rodape(String back_rodape) {
		this.back_rodape = back_rodape;
	}

	public String getFonte_rodape() {
		return fonte_rodape;
	}

	public void setFonte_rodape(String fonte_rodape) {
		this.fonte_rodape = fonte_rodape;
	}

	public String getFoto_empresa() {
		return foto_empresa;
	}

	public void setFoto_empresa(String foto_empresa) {
		this.foto_empresa = foto_empresa;
	}

	public String getFoto_produto() {
		return foto_produto;
	}

	public void setFoto_produto(String foto_produto) {
		this.foto_produto = foto_produto;
	}

	public String getFoto_galeria() {
		return foto_galeria;
	}

	public void setFoto_galeria(String foto_galeria) {
		this.foto_galeria = foto_galeria;
	}

	public String getFonte_chamada() {
		return fonte_chamada;
	}

	public void setFonte_chamada(String fonte_chamada) {
		this.fonte_chamada = fonte_chamada;
	}

	public String getBack_chamada() {
		return back_chamada;
	}

	public void setBack_chamada(String back_chamada) {
		this.back_chamada = back_chamada;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBack_rodape2() {
		return back_rodape2;
	}

	public void setBack_rodape2(String back_rodape2) {
		this.back_rodape2 = back_rodape2;
	}

	public String getFonte_rodape2() {
		return fonte_rodape2;
	}

	public void setFonte_rodape2(String fonte_rodape2) {
		this.fonte_rodape2 = fonte_rodape2;
	}

	public List<String> getFotos_slide() {
		return fotos_slide;
	}

	public void setFotos_slide(List<String> fotos_slide) {
		this.fotos_slide = fotos_slide;
	}

	public List<Produto> getProdutos() {
		return produtos;
	}

	public void setProdutos(List<Produto> produtos) {
		this.produtos = produtos;
	}

}
