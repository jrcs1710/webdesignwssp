<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<c:import url="template/cabecalho_admin.jsp" />
<style>
th {
	text-align:center;
}
</style>
<script>
function excluirSite(id,titulo){		
	$.post("excluirSite",{'id' : id, 'titulo':titulo}, function(){
		$("#linha"+id).hide("slow");			
	});
} 

</script>

<div class="col-sm-2"></div>
<div class="col-sm-8">
	<fieldset>
		<legend>Lista de Sites</legend>
		<table id="tabela" class="table table-bordered table-striped"
			style="text-align: center;">
			<thead>
				<tr>
					<th>ID</th>
					<th>TÍTULO</th>
					<th>ALTERAR</th>
					<th>EXCLUIR</th>
				</tr>
			</thead>
			<c:forEach items="${listaSites }" var="site">
				<tr id="linha${site.id }">
					<td>${site.id}</td>
					<td>${site.titulo }</td>
					<td><a href="alterarSite?id=${site.id }">Alterar</a></td>
					<td><a href="#" onclick="excluirSite(${site.id},'${site.titulo }')">Excluir</a></td>
				</tr>
			</c:forEach>
		</table>

	</fieldset>
</div>
<c:import url="template/rodape_admin.jsp" />