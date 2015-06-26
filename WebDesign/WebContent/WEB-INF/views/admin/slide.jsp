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
		<li class="active"><a href="slide">Slider</a></li>
		<li><a href="#">Página inicial</a></li>
		<li><a href="#">Produtos</a></li>
		<li><a href="#">Rodapé</a></li>
	</ul>
</div>
<h4>Selecione os arquivos para upload:</h4>
<div class="col-md-9">
	<form class="form-horizontal" enctype="multipart/form-data"
		action="uploadSlide" method="post">		

		<div class="form-group">
			<label class="control-label col-sm-2">Imagem:</label>
			<div class="col-sm-7">
				<input type="file" multiple="multiple" name="files" class="file"
					required="required">
			</div>			
		</div>
	</form>
	<br/><br/><br/>

</div>

<c:import url="template/rodape_admin.jsp" />