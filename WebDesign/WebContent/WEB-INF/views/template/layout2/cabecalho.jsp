<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Título do Site</title>
<link
	href=<c:url value="resources/bootstrap-3.3.5-dist/css/bootstrap.min.css"/>
	rel="stylesheet">
<link href=<c:url value="resources/css/estilo.css"/> rel="stylesheet">
<link href=<c:url value="resources/icomoon/icomoon.css"/>
	rel="stylesheet">
<link href=<c:url value="resources/css/image_effect.css"/>
	rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src=<c:url value="resources/jquery/jquery-2.1.4.min.js"/>></script>
<script
	src=<c:url value="resources/bootstrap-3.3.5-dist/js/bootstrap.min.js"/>></script>
</head>
<body>
	<div class="containner">
		<header class="page-header">
			<c:choose>
				<c:when test="${empty site }">
					<img class="logo" style="margin-left: 14px;" alt="Logomarca empresa"
						src="resources/imagens/logo.png">
				</c:when>
				<c:otherwise>
					<img class="logo" style="margin-left: 14px;" alt="Logomarca empresa"
						src=<c:url value="${site.logo }"/>>
				</c:otherwise>
			</c:choose>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#"><span class="icon icon-facebook2"></span></a></li>
				<li><a href="#"><span class="icon icon-instagram"></span></a></li>
				<li><a href="#"><span class="icon icon-twitter2"></span></a></li>
			</ul>
		</header>
		<div class="col-md-3">
			<nav class="navbar navbar-inverse"
				style="background-color: #000;">
				

					<ul class="nav nav-pills nav-stacked" style="background-color: #000;">
						<li><a href="#">Home</a></li>
						<li><a href="#">Empresa</a></li>
						<li><a href="#">Produtos</a></li>
						<li><a href="#">Localização</a></li>
						<li><a href="#">Galeria</a></li>
					</ul>
			
			</nav>
		</div>