<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<style>
.footer span, .footer a, .footer h4 {
	color:${site.fonte_rodape};
}
#foot {
	background-color: ${site.back_rodape2};
}
#foot h5 {
	color:${site.fonte_rodape2};
}
</style>
<div class="containner">
<footer class="footer" style="background-color: ${site.back_rodape};">
	<div class="row" >
		<div class="col-md-3" >

			<h4><a href=<c:url value="/index/${site.titulo }"/>>Home</a></h4>
			<h4><a href=<c:url value="/empresa"/>>Empresa</a></h4>
			<h4><a href=<c:url value="/produtos"/>>Produtos</a></h4>
			<h4><a href=<c:url value="/localizacao"/>>Localização</a></h4>
			<h4><a href=<c:url value="/clientes"/>>Clientes</a></h4>

		</div>
		<div class="col-md-6"></div>
		<div class="col-md-3">
			<h4>Contatos</h4>

			<h4>
				<span class="icon icon-phone"></span>&nbsp;${site.telefone }
			</h4>
			<h4>
				<span class="icon icon-mail3"></span>&nbsp;<a
					href="mailto:${site.email }">${site.email }</a>
			</h4>
		</div>
	</div>
	<div id="foot">
		<h5>WebDesign World Skills São Paulo 2015</h5>
	</div>
</footer>
</div>

</body>
</html>