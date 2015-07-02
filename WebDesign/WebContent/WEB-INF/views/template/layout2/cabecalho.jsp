<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${site.titulo }</title>
<link
	href=<c:url value="/resources/bootstrap-3.3.5-dist/css/bootstrap.min.css"/>
	rel="stylesheet">
<link href=<c:url value="/resources/css/estilo.css"/> rel="stylesheet">
<link href=<c:url value="/resources/icomoon/icomoon.css"/>
	rel="stylesheet">
<link href=<c:url value="/resources/css/image_effect.css"/>
	rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src=<c:url value="/resources/jquery/jquery-2.1.4.min.js"/>></script>
<script
	src=<c:url value="/resources/bootstrap-3.3.5-dist/js/bootstrap.min.js"/>></script>
</head>
<style>
.navbar-inverse .nav-pills li a {
	color:  ${site.fonte_menu};
}
.page-header span {
	color:  ${site.back_menu};
}

</style>

<body>
	<div class="containner">
		<header class="page-header">
			<c:choose>
				<c:when test="${empty site }">
					<img class="logo" style="margin-left: 14px;"
						alt="Logomarca empresa" src=<c:url value="/resources/imagens/logo.png"/>>
				</c:when>
				<c:otherwise>
					<img class="logo" style="margin-left: 14px;"
						alt="Logomarca empresa" src=<c:url value="${site.logo }"/>>
				</c:otherwise>
			</c:choose>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#"><span class="icon icon-facebook2"></span></a></li>
				<li><a href="#"><span class="icon icon-instagram"></span></a></li>
				<li><a href="#"><span class="icon icon-twitter2"></span></a></li>
			</ul>
		</header>
		<div class="col-md-3">
			<nav class="navbar navbar-inverse" style="background-color:${site.back_menu};">


				<ul class="nav nav-pills nav-stacked"
					>
					<li><a href=<c:url value="/index/${site == null ? titulo : site.titulo }"/>>Home</a></li>
					<li><a href=<c:url value="/empresa"/>>Empresa</a></li>
					<li><a href=<c:url value="/produtos"/>>Produtos</a></li>
					<li><a href=<c:url value="/localizacao"/>>Localização</a></li>
					<li><a href=<c:url value="/clientes"/>>Clientes</a></li>
				</ul>

			</nav>
		</div>