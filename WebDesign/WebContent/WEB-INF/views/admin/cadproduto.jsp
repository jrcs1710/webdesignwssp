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
		<li><a href="novo">Layout</a></li>
		<li><a href="menu">Menu</a></li>
		<li><a href="slide">Slider</a></li>
		<li><a href="destaques">Destaques</a></li>
		<li class="active"><a href="cadprodutos">Produtos</a></li>
		<li><a href="#">Rodapé</a></li>
	</ul>
</div>

<div class="col-md-9">
	<fieldset>
		<legend>Cadastro de produtos</legend>
		<form enctype="multipart/form-data" class="form-horizontal"
			action="criarSite" method="post">
			<c:if test="${not empty siteAdmin }">
				<input type="hidden" value="${siteAdmin.id }" name="idSite">
			</c:if>
			<div class="form-group">
				<label class="control-label col-sm-2">Descrição:</label>

				<div class="col-sm-7">
					<input type="text" required="required" name="titulo"
						class="form-control" placeholder="Nome do produto">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2">Foto:</label>
				<div class="col-sm-7">
					<input type="file" name="imagem" class="file" required="required">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">Destaque:</label>

				<div class="col-sm-1">
					<input type="checkbox" required="required" name="titulo"
						placeholder="Nome do produto" class="form-control">
				</div>
			</div>

			<div class="col-sm-12" style="text-align: center;">
				<button class="btn btn-primary btn-md" type="submit">Adicionar</button>
			</div>
			<br /> <br /> <br /> <br />
		</form>
	</fieldset>
</div>

<c:import url="template/rodape_admin.jsp" />