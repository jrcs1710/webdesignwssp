<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<c:import url="/WEB-INF/views/template/layout1/cabecalho.jsp" />

<h3 style="color:${site.back_chamada}">Nossos produtos</h3>
<div class="row">
	<c:if test="${produtosSite == null }">
		<c:forEach var="i" begin="1" end="12" step="1">
			<div class="col-sm-3">
				<figure style="margin-top: 10px;">
					<img
						src=<c:url value="${empty site.foto_empresa ? '/resources/imagens/coluna.png' : site.foto_empresa}"/>>

					<figcaption
						style="background-color: ${empty site.back_chamada ? '#000000' : site.back_chamada};color:${empty site.fonte_chamada ? '#ffffff' : site.fonte_chamada}">Produto
						${i }</figcaption>
				</figure>
			</div>
		</c:forEach>
	</c:if>

	<c:if test="${produtosSite != null }">
		<c:forEach items="${produtosSite }" var="produto">
			<div class="col-sm-3">
				<figure style="margin-top: 10px;">
					<img src=<c:url value="${produto.foto}"/>>

					<figcaption
						style="background-color: ${empty site.back_chamada ? '#000000' : site.back_chamada};color:${empty site.fonte_chamada ? '#ffffff' : site.fonte_chamada}">${produto.descricao }
					</figcaption>
				</figure>
			</div>
		</c:forEach>
	</c:if>

</div>
<c:import url="/WEB-INF/views/template/layout1/rodape.jsp" />