<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<c:import url="template/cabecalho_admin.jsp" />
<script src="resources/js/rgb_hex.js"></script>
<link href=<c:url value="resources/fileinput/css/fileinput.css"/>
	media="all" rel="stylesheet" type="text/css" />
<script src=<c:url value="resources/fileinput/js/fileinput.min.js"/>
	type="text/javascript"></script>

<div class="col-md-3">
	<ul class="nav nav-pills nav-stacked">
		<li><a href="novo">Layout</a></li>
		<li><a href="menu">Menu</a></li>
		<li><a href="slide">Slider</a></li>
		<li class="active"><a href="destaques">Destaques</a></li>
		<li><a href="cadprodutos">Produtos</a></li>
		<li><a href="rodape">Rodapé</a></li>
	</ul>
</div>

<div class="col-md-9">
	<form class="form-horizontal" action="defineDestaques" enctype="multipart/form-data"  method="post">
		<fieldset>
			<legend>Padrão de cor dos destaques</legend>
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
						onblur="atualizaBack(this,cor_resultante)" value="${empty siteAdmin.back_chamada ? siteAdmin.back_menu : siteAdmin.back_chamada}"
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
						onblur="atualizaFonte(this,cor_resultante)" name="fontColor"
						value="${empty siteAdmin.fonte_chamada ? siteAdmin.fonte_menu : siteAdmin.fonte_chamada}">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-3">Preview:</label>
				<div class="col-sm-6" id="cor_resultante"
					style="background-color:${empty siteAdmin.back_chamada ? siteAdmin.back_menu : siteAdmin.back_chamada};color: ${empty siteAdmin.fonte_chamada ? siteAdmin.fonte_menu : siteAdmin.fonte_chamada};">
					<h2>Texto</h2>
				</div>
			</div>
		</fieldset>
		<fieldset>
			<legend>Imagens dos destaques</legend>
			<div class="form-group">
				<label class="control-label col-sm-2">Empresa:</label>
				<div class="col-sm-8">
					<input type="file" name="imagens" class="file"
						required="required">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">Produtos:</label>
				<div class="col-sm-8">
					<input type="file" name="imagens" class="file"
						required="required">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">Clientes:</label>
				<div class="col-sm-8">
					<input type="file" name="imagens" class="file"
						required="required">
				</div>
			</div>
			<div class="col-sm-12" style="text-align: center;">
				<button class="btn btn-primary btn-md" type="submit">Próximo</button>
			</div>
		</fieldset>
		<br /> <br /> <br /> <br />

	</form>

</div>

<c:import url="template/rodape_admin.jsp" />