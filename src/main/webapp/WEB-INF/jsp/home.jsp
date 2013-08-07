<%@ taglib prefix="authz"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="custom"%>

<custom:main>

	<div class="alert alert-block alert-success">
		<button type="button" class="close" data-dismiss="alert">
			<i class="icon-remove"></i>
		</button>

		<i class="icon-ok green"></i> Seja bem vindo ao <strong class="green">
			Catálago VPSA <small>(v1.0)</small>
		</strong>, aqui você pode pesquisar os produtos e alterar as informações que
		serão exibidas ao cliente.
	</div>

	<div id="myCarousel" class="carousel slide">
		<div class="jumbotron masthead">
			<div class="carousel-inner">
				<div class="item active">

					<div class="container">
						<h1>Catálago VPSA</h1>
						<p>Crie seu catálato de produtos na web de maneira rápida e
							prática utilizando esse gerador de catálagos de produtos
							integrado com o VPSA</p>
						<p>Exiba seus produtos, ofertas e preços para seus clientes</p>
						<p>
							<a href="<c:url value="/produtos/saibamais" />"
								class="btn btn-primary btn-large">Saiba mais</a>
						</p>
					</div>

				</div>

				<div class="item">

					<div class="container">
						<h1>Rede Social</h1>
						<p>Exponha seus produtos no facebook, quanto mais os clientes
							curtem, mais você vende.</p>
						<p>
							<a href="<c:url value="/produtos/saibamais" />"
								class="btn btn-primary btn-large">Saiba mais</a>
						</p>
					</div>

				</div>

			</div>
		</div>
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
		<a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
	</div>
</custom:main>
