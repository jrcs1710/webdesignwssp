<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<c:import url="/WEB-INF/views/template/layout1/cabecalho.jsp" />

<style>
figure {
	border: 1px solid;
	border-color: ${empty site.back_chamada? '#000000': site.back_chamada
}

;
}
figcaption {
	background-color: ${empty site.back_chamada? '#000000': site.back_chamada
}

;
color:
 
${
empty
 
site
.fonte_chamada
 
?
'
#ffffff
'
 
:
 
site
.fonte_chamada
}
;
}
#clientes img {
	padding: 20px;
}
</style>

<script src=<c:url value="/resources/js/instagram.js"/>></script>
<h3 style="color:${site.back_chamada}">Nossos clientes</h3>
<div id="clientes" class="row">
	<c:if test="${site == null }">
<c:forEach var="i" begin="1" end="8" step="1">
			<div class="col-sm-3">
				<figure style="margin-top: 10px;">
					<img
						src=<c:url value="/resources/imagens/coluna.png"/>>

					<figcaption>Cliente ${i }
					</figcaption>
				</figure>
			</div>
		</c:forEach>
	</c:if>
	<c:if test="${site != null }">
		<script>
		loadImages("${site.titulo}"+"nawssp2015");
		</script>
	</c:if>
</div>
<c:import url="/WEB-INF/views/template/layout1/rodape.jsp" />