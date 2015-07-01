<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<c:import url="template/cabecalho_admin.jsp" />
<script>
	function excluirSlide(id,caminho){		
		$.post("excluirSlide",{'idSlide' : id, 'caminho':caminho}, function(){
			$("#linha"+id).hide("slow");			
		});
	} 
</script>
<link href=<c:url value="resources/fileinput/css/fileinput.css"/>
	media="all" rel="stylesheet" type="text/css" />
<script src=<c:url value="resources/fileinput/js/fileinput.min.js"/>
	type="text/javascript"></script>


<div class="col-md-3">
	<ul class="nav nav-pills nav-stacked">
		<li><a href="novo">Layout</a></li>
		<li><a href="menu">Menu</a></li>
		<li class="active"><a href="slide">Slider</a></li>
		<li><a href="destaques">Destaques</a></li>
		<li><a href="cadprodutos">Produtos</a></li>
		<li><a href="rodape">Rodapé</a></li>
	</ul>
</div>
<fieldset>
<legend>Envio de imagens</legend>
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
</fieldset>

<br />
<br />
<c:if test="${not empty fotos_slide }">
<fieldset>
<legend>Imagens cadastradas</legend>
	<h4>Fotos:</h4>
	<table id="tabela" class="table table-bordered table-striped">
		<thead>
			<tr>
				<th>Caminho</th>
				<th>Excluir</th>
			</tr>
		</thead>
		<c:forEach items="${fotos_slide }" var="foto">
			<tr id="linha${foto.id }">
				<td>${foto.caminho }</td>
				<td><a href="#"
					onClick="excluirSlide(${foto.id},'${foto.caminho }')">Excluir</a></td>
			</tr>
		</c:forEach>
	</table>
	</fieldset>
</c:if>
<br />

</div>

<c:import url="template/rodape_admin.jsp" />