<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<c:import url="/WEB-INF/views/template/layout2/cabecalho.jsp" />
<div class="col-md-9">
		<div id="myCarousel" class="carousel slide" data-ride=carousel>
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="resources/imagens/slider.png" alt="Imagem1">
				</div>

				<div class="item">
					<img src="resources/imagens/slider.png" alt="Chania">
				</div>

				<div class="item">
					<img src="resources/imagens/slider.png" alt="Flower">
				</div>

				<div class="item">
					<img src="resources/imagens/slider.png" alt="Flower">
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel" role="button"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		<br />
		<div class="row">
			<div class="col-sm-4">
				<figure>
					<a href="#"> <img src="resources/imagens/coluna.png">
					</a>
					<figcaption>Empresa</figcaption>
				</figure>
			</div>			
			<div class="col-sm-4">
				<figure>
					<img src="resources/imagens/coluna.png">
					<figcaption>Produtos</figcaption>
				</figure>
			</div>
	
			<div class="col-sm-4">
				<figure>
					<img src="resources/imagens/coluna.png">
					<figcaption>Galeria</figcaption>
				</figure>
			</div>
		</div>
		<h3>Produtos em destaque:</h3>
		<div class="row destaque">
			<div class="col-sm-3 col-md-3 col_dest">
				<img src="resources/imagens/coluna_dest.png">
				<div class="mask">
					<h2>Destaque 1</h2>
				</div>
			</div>
			<div class="col-sm-3 col-md-3 col_dest">
				<img src="resources/imagens/coluna_dest.png">
				<div class="mask">
					<h2>Destaque 2</h2>
				</div>
			</div>
			<div class="col-sm-3 col-md-3 col_dest">
				<img src="resources/imagens/coluna_dest.png">
				<div class="mask">
					<h2>Destaque 3</h2>
				</div>
			</div>
			<div class="col-sm-3 col-md-3 col_dest">
				<img src="resources/imagens/coluna_dest.png">
				<div class="mask">
					<h2>Destaque 4</h2>
				</div>
			</div>

		</div>
		</div>
<c:import url="/WEB-INF/views/template/layout2/rodape.jsp" />