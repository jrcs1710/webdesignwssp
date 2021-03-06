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
		<li class="active"><a href="novo">Layout</a></li>
		<li><a href="menu">Menu</a></li>
		<li><a href="slide">Slider</a></li>
		<li><a href="destaques">Destaques</a></li>
		<li><a href="cadprodutos">Produtos</a></li>
		<li><a href="rodape">Rodap�</a></li>
	</ul>
</div>

<div class="col-md-9">
<fieldset>
<legend>Defini��es de layout</legend>
	<form enctype="multipart/form-data" class="form-horizontal"
		action="criarSite" method="post">
		<c:if test="${not empty siteAdmin }">
			<input type="hidden" value="${siteAdmin.id }" name="id">
		</c:if>
		<div class="form-group">
			<label class="control-label col-sm-2">Titulo:</label>

			<div class="col-sm-8">
				<input type="text" required="required" name="titulo"
					class="form-control" placeholder="T�tulo do site"
					value="${siteAdmin.titulo }">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">Logo:</label>
			<div class="col-sm-8">
				<input type="file" name="fileLogo" class="file" required="required">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">Layout:</label>
			<div class="col-sm-4">
				<div class="radio">
					<img style="border: 1px solid"
						src=<c:url value="resources/imagens/layout_1.png"/>> <br />
					<label><input type="radio" required="required"
						<c:if test="${siteAdmin.layout == 1}">checked</c:if> name="layout"
						value=1>Op��o 1</label>

				</div>
			</div>
			<div class="col-sm-4">
				<div class="radio">
					<img style="border: 1px solid"
						src=<c:url value="resources/imagens/layout_2.png"/>> <br />
					<label><input type="radio" required="required"
						<c:if test="${siteAdmin.layout == 2}">checked</c:if>  name="layout"
						value=2>Op��o 2</label>
				</div>
			</div>
		</div>
		<div class="col-sm-12" style="text-align: center;">
			<button class="btn btn-primary btn-md" type="submit">Pr�ximo</button>
		</div>
		<br /> <br /> <br /> <br />
	</form>
	</fieldset>
</div>

<c:import url="template/rodape_admin.jsp" />