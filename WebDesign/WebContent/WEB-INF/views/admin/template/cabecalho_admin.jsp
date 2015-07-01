<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Administração</title>
<meta charset="ISO-8859-1">
<link
	href=<c:url value="resources/bootstrap-3.3.5-dist/css/bootstrap.min.css"/>
	rel="stylesheet">
<link href=<c:url value="resources/css/estilo.css"/> rel="stylesheet">
<link href=<c:url value="resources/icomoon/icomoon.css"/>
	rel="stylesheet">
<link href=<c:url value="resources/css/image_effect.css"/>
	rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src=<c:url value="resources/jquery/jquery-2.1.4.min.js"/> charset="UTF-8"></script>
<script
	src=<c:url value="resources/bootstrap-3.3.5-dist/js/bootstrap.min.js"/> charset="UTF-8"></script>
</head>
<body>
	<div class="containner">
		<header class="page-header">
			<h1>Administração do Site</h1>
		</header>
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">

				<ul class="nav navbar-nav">
					<li><a href="#">Lista</a></li>
					<li><a href="#">Novo Site</a></li>
				</ul>
			</div>
		</nav>