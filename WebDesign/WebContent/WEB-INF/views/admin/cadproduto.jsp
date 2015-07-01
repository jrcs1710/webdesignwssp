<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<c:import url="template/cabecalho_admin.jsp" />
<link href=<c:url value="resources/fileinput/css/fileinput.css"/>
	media="all" rel="stylesheet" type="text/css" />
<script src=<c:url value="resources/fileinput/js/fileinput.min.js"/>
	type="text/javascript"></script>

<script>
function inserir(){
	var formUrl = "cadastraProduto";
	var data = new FormData();
	var idSite = $('#idSite').val();
	var descricao = $('#descricao').val();
	var destaque = $('#destaque').val();
	var imagem = $('#imagem').get(0).files[0];
	data.append('idSite',idSite);
	data.append('descricao',descricao);
	data.append('destaque',destaque);
	data.append('imagem',imagem);
	
	$.ajax({
		url:formUrl,
		type:'POST',
		data:data,		
		mimeType:"multipart/form-data",
		contentType:false,
		cache:false,
		processData:false,
		success:function(response){			
			$("#imagem").closest('form').trigger('reset');		
			$("#tabela tr:last").after("<tr id='linha"+response+"'><td>"+descricao+"</td><td><a href='#' onclick='excluirProduto("+response+")'>Excluir</a></td></tr>");
		},
		error:function(erro){
			alert('Erro: '+erro.message);
		}		
	});
}
function excluirProduto(id){		
	$.post("excluirProduto",{'idProduto' : id}, function(){
		$("#linha"+id).hide("slow");			
	});
} 
</script>
<div class="col-md-3">
	<ul class="nav nav-pills nav-stacked">
		<li><a href="novo">Layout</a></li>
		<li><a href="menu">Menu</a></li>
		<li><a href="slide">Slider</a></li>
		<li><a href="destaques">Destaques</a></li>
		<li class="active"><a href="cadprodutos">Produtos</a></li>
		<li><a href="rodape">Rodapé</a></li>
	</ul>
</div>

<div class="col-md-9">
	<fieldset>
		<legend>Cadastro de produtos</legend>
		<form id="formulario" class="form-horizontal"
			accept-charset="ISO-8859-1">
			<c:if test="${not empty siteAdmin }">
				<input type="hidden" value="${siteAdmin.id }" id="idSite"
					name="idSite">
			</c:if>
			<div class="form-group">
				<label class="control-label col-sm-2">Descrição:</label>

				<div class="col-sm-7">
					<input type="text" required="required" id="descricao"
						name="descricao" class="form-control"
						placeholder="Nome do produto">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2">Foto:</label>
				<div class="col-sm-7">
					<input type="file" id="imagem" name="imagem" class="file"
						required="required">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">Destaque:</label>

				<div class="col-sm-1">
					<input type="checkbox" required="required" id="destaque"
						name="destaque" class="form-control">
				</div>
			</div>

			<div class="col-sm-12" style="text-align: center;">
				<button class="btn btn-primary btn-md" type="button"
					onclick="inserir()">Adicionar</button>
			</div>
			<br /> <br /> <br />
		</form>
	</fieldset>
	<div class="col-sm-10" style="text-align: center;">
		<table id="tabela" class="table table-bordered table-striped">
			<thead>
				<tr>
					<th style="text-align: center;">Produto</th>
					<th style="text-align: center;">Excluir</th>
				</tr>
			</thead>
			<c:forEach items="${produtos }" var="produto">
				<tr id="linha${produto.id }">
					<td>${produto.descricao}</td>
					<td><a href="#" onclick="excluirProduto(${produto.id})">Excluir</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="col-sm-10" style="text-align: center;">
		<a href="rodape"><button class="btn btn-primary btn-md">Próximo</button></a>
	</div>
</div>

<c:import url="template/rodape_admin.jsp" />