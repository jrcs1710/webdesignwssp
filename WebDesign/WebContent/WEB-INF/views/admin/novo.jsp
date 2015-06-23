<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<c:import url="template/cabecalho_admin.jsp" />
<link href=<c:url value="resources/fileinput/css/fileinput.css"/>
	media="all" rel="stylesheet" type="text/css" />
<script src=<c:url value="resources/fileinput/js/fileinput.min.js"/>
	type="text/javascript"></script>
<div class="col-md-3">
	<ul class="nav nav-pills nav-stacked">
		<li class="active"><a href="#">Layout</a></li>
		<li><a href="#">Cabeçalho</a></li>
		<li><a href="#">Slider</a></li>
		<li><a href="#">Página inicial</a></li>
		<li><a href="#">Produtos</a></li>
		<li><a href="#">Rodapé</a></li>
	</ul>
</div>

<div class="col-md-9">
	<form enctype="multipart/form-data" class="form-horizontal" action="criarSite" method="post">
		<div class="form-group">
			<label class="control-label col-sm-2">Titulo:</label>

			<div class="col-sm-8">
				<input type="text" required="required" name="titulo" class="form-control"
					placeholder="Título do site">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">Logo:</label>
			<div class="col-sm-8">
				<input type="file" name="fileLogo" class="file"
					placeholder="Título do site" required="required">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">Layout:</label>
			<div class="col-sm-4">
				<div class="radio">
					<img style="border: 1px solid"
						src=<c:url value="resources/imagens/layout_1.png"/>> <br />
					<label><input type="radio" required="required" name="layout" value="1">Opção
						1</label>
				</div>
			</div>			
			<div class="col-sm-4">
				<div class="radio">
					<img style="border: 1px solid"
						src=<c:url value="resources/imagens/layout_1.png"/>> <br />
					<label><input type="radio" required="required" name="layout" value="2">Opção
						2</label>
				</div>
			</div>
		</div>
		<div class="col-sm-12" style="text-align: center;">
			<button class="btn btn-primary btn-md" type="submit">Salvar</button>
		</div>
		<br/>
		<br/>
		<br/>
	</form>
</div>

<c:import url="template/rodape_admin.jsp" />