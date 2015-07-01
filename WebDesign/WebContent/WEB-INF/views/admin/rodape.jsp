<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<c:import url="template/cabecalho_admin.jsp" />
<link href=<c:url value="resources/fileinput/css/fileinput.css"/>
	media="all" rel="stylesheet" type="text/css" />
<script src=<c:url value="resources/fileinput/js/fileinput.min.js"/>
	type="text/javascript"></script>
<script src="resources/js/rgb_hex.js"></script>

<div class="col-md-3">
	<ul class="nav nav-pills nav-stacked">
		<li><a href="novo">Layout</a></li>
		<li><a href="menu">Menu</a></li>
		<li><a href="slide">Slider</a></li>
		<li><a href="destaques">Destaques</a></li>
		<li><a href="cadprodutos">Produtos</a></li>
		<li class="active"><a href="rodape">Rodapé</a></li>
	</ul>
</div>

<div class="col-md-9">
	<form class="form-horizontal" action="defineRodape" method="post">
		<fieldset>
			<legend>Dados de contato</legend>
			<div class="form-group">
				<label class="control-label col-sm-3">Telefone:</label>
				<div class="col-sm-4">
					<input type="tel" required="required" name="telefone"
						class="form-control" placeholder="Telefone de contato"
						value="${siteAdmin.telefone }">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3">E-mail:</label>
				<div class="col-sm-4">
					<input type="email" required="required" name="email"
						class="form-control" placeholder="Telefone de contato"
						value="${siteAdmin.email }">
				</div>
			</div>
		</fieldset>
		<fieldset>
			<legend>Definições do 1º rodapé</legend>

			<input type="hidden" value="${siteAdmin.id }" name="id" />
			<div class="form-group">
				<label class="control-label col-sm-3">Cor do background:</label>

				<div class="col-sm-3" style="text-align: center;">
					<h4>Selecione:</h4>
					<input type="color" class="col-md-3 form-control"
						onchange="colorBackClick(this,input_hex_back)">

				</div>
				<div class="col-sm-3">
					<h4>Código Hexadecimal:</h4>
					<input type="text" id="input_hex_back"
						class="col-sm-3 form-control" style="text-align: center;"
						readonly="readonly"
						value="${empty siteAdmin.back_rodape ? siteAdmin.back_menu : siteAdmin.back_rodape}"
						name="backColor">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-3">Cor da fonte:</label>

				<div class="col-sm-3" style="text-align: center;">
					<h4>Selecione:</h4>
					<input type="color" class="col-md-3 form-control"
						onchange="colorFonteClick(this,input_hex_fonte)">

				</div>
				<div class="col-sm-3">
					<h4>Código Hexadecimal:</h4>
					<input type="text" id="input_hex_fonte"
						class="col-sm-3 form-control" style="text-align: center;"
						readonly="readonly" name="fontColor"
						value="${empty siteAdmin.fonte_rodape ? siteAdmin.fonte_menu : siteAdmin.fonte_rodape }">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3">Preview:</label>
				<div class="col-sm-6" id="cor_resultante"
					style="background-color:${empty siteAdmin.back_menu ? '#000000' : siteAdmin.back_menu};color: ${empty siteAdmin.fonte_menu ? '#ffffff' : siteAdmin.fonte_menu};">
					<h2>Texto</h2>
				</div>
			</div>
		</fieldset>
		<!--  2º RODAPÉ -->
		<fieldset>
			<legend>Definições do 2º rodapé</legend>
			<div class="form-group">
				<label class="control-label col-sm-3">Cor do background:</label>

				<div class="col-sm-3" style="text-align: center;">
					<h4>Selecione:</h4>
					<input type="color" class="col-md-3 form-control"
						onchange="colorBackClick2(this,input_hex_back)">

				</div>
				<div class="col-sm-3">
					<h4>Código Hexadecimal:</h4>
					<input type="text" id="input_hex_back"
						class="col-sm-3 form-control" style="text-align: center;"
						readonly="readonly"
						value="${empty siteAdmin.back_rodape2 ? '#000000' : siteAdmin.back_rodape2}"
						name="backColor2">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-3">Cor da fonte:</label>

				<div class="col-sm-3" style="text-align: center;">
					<h4>Selecione:</h4>
					<input type="color" class="col-md-3 form-control"
						onchange="colorFonteClick2(this,input_hex_fonte)">

				</div>
				<div class="col-sm-3">
					<h4>Código Hexadecimal:</h4>
					<input type="text" id="input_hex_fonte"
						class="col-sm-3 form-control" style="text-align: center;"
						readonly="readonly" name="fontColor2"
						value="${empty siteAdmin.fonte_rodape2 ? '#ffffff' : siteAdmin.fonte_rodape2}">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3">Preview:</label>
				<div class="col-sm-6" id="cor_resultante_2"
					style="background-color:${empty siteAdmin.back_menu ? '#000000' : siteAdmin.back_menu};color: ${empty siteAdmin.fonte_menu ? '#ffffff' : siteAdmin.fonte_menu};">
					<h2>Texto</h2>
				</div>
			</div>



			<div class="col-sm-12" style="text-align: center;">
				<button class="btn btn-primary btn-md" type="submit">Próximo</button>
			</div>
			<br /> <br /> <br /> <br />

		</fieldset>
	</form>
</div>

<c:import url="template/rodape_admin.jsp" />