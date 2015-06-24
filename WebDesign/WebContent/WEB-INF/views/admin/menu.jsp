<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<c:import url="template/cabecalho_admin.jsp" />
<link href=<c:url value="resources/fileinput/css/fileinput.css"/>
	media="all" rel="stylesheet" type="text/css" />
<script src=<c:url value="resources/fileinput/js/fileinput.min.js"/>
	type="text/javascript"></script>
<script language="JavaScript" src="rgb_hex.js"></script>

<div class="col-md-3">
	<ul class="nav nav-pills nav-stacked">
		<li><a href="novo">Layout</a></li>
		<li class="active"><a href="menu">Menu</a></li>
		<li><a href="#">Slider</a></li>
		<li><a href="#">Página inicial</a></li>
		<li><a href="#">Produtos</a></li>
		<li><a href="#">Rodapé</a></li>
	</ul>
</div>

<div class="col-md-9">
	<form enctype="multipart/form-data" class="form-horizontal"
		action="criarSite" method="post">
		<div class="form-group">
			<label class="control-label col-sm-3">Cor de background:</label>

			<div class="col-sm-2" style="text-align: center;">
				<h4>R</h4>
				<input id="input_red_back" type="number" required="required"
					name="titulo" class="form-control input_number">
			</div>
			<div class="col-sm-2">
				<h4>G</h4>
				<input id="input_green_back" type="number" required="required"
					name="titulo" class="form-control input_number">
			</div>
			<div class="col-sm-2">
				<h4>B</h4>
				<input type="number" required="required" name="titulo"
					class="form-control input_number">
			</div>
			<div class="col-sm-3">
				<h4>Hexadecimal</h4>
				<input type="text" required="required" name="back_menu"
					class="form-control input_number" readonly="readonly">
			</div>
		</div>

		<div class="col-sm-12" style="text-align: center;">
			<button class="btn btn-primary btn-md" type="submit">Salvar</button>
		</div>
		<br /> <br /> <br />
	</form>
</div>

<c:import url="template/rodape_admin.jsp" />