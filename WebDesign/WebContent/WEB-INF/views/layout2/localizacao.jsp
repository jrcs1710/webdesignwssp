<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<c:import url="/WEB-INF/views/template/layout2/cabecalho.jsp" />
<div class="col-md-9">	
	<h3 style="color:${site.back_chamada}">Localização:</h3>
	<div class="embed-responsive embed-responsive-4by3">
		<iframe
			src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3658.485231788425!2d-46.63340782018395!3d-23.515043993403324!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94ce5879645bd58b%3A0x22a09888a0bb727d!2sParque+Anhembi%2C+S%C3%A3o+Paulo+-+SP!5e0!3m2!1spt-BR!2sbr!4v1435873084280"
			width="700" height="750" frameborder="0" style="border: 0"
			allowfullscreen></iframe>
	</div>
</div>
<c:import url="/WEB-INF/views/template/layout2/rodape.jsp" />