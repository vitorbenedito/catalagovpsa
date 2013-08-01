<%@ taglib prefix="authz"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>Catálago de Produtos - Painel de Administração</title>
		<meta name="description" content="This is page-header (.page-header &gt; h1)" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<!--basic styles-->

		<link href="<c:url value="/assets/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet" />
		<link href="<c:url value="/assets/bootstrap/css/bootstrap-responsive.min.css"/>" rel="stylesheet"/>
		<link rel="stylesheet" href="<c:url value="/assets/themes/font-awesome/css/font-awesome.min.css"/>"/>

		<!--[if IE 7]>
		  <link rel="stylesheet" href="<c:url value="/assets/themes/font-awesome/css/font-awesome-ie7.min.css"/>" />
		<![endif]-->

		<!--page specific plugin styles-->

		<link rel="stylesheet" href="<c:url value="/assets/themes/css/prettify.css"/>" />

		<!--fonts-->

		<link rel="stylesheet" href="<c:url value="http://fonts.googleapis.com/css?family=Open+Sans:400,300"/>" />

		<!--ace styles-->

		<link rel="stylesheet" href="<c:url value="/assets/themes/css/w8.min.css"/>" />
		<link rel="stylesheet" href="<c:url value="/assets/themes/css/w8-responsive.min.css"/>" />
		<link rel="stylesheet" href="<c:url value="/assets/themes/css/w8-skins.min.css"/>" />
		
		<link href="<c:url value="/assets/css/vpsa.css" />" rel="stylesheet" media="screen">

		<!--[if lte IE 8]>
		  <link rel="stylesheet" href="/assets/themes/css/ace-ie.min.css" />
		<![endif]-->

		<!--inline styles if any-->
	</head>

	<body>
		<div class="navbar navbar-inverse">
			<div class="navbar-inner">
				<div class="container-fluid">
					<a href="#" class="brand">
						<small>
							<i class="icon-unlock-alt"></i>
							Catálago de Produtos - Painel de Administração
						</small>
					</a><!--/.brand-->

					<ul class="nav ace-nav pull-right">
						

						<li class="light-blue user-profile">
							<a data-toggle="dropdown" href="#" class="user-menu dropdown-toggle">
								<img class="nav-user-photo" src="<c:url value="/assets/themes/images/user.png"/>" alt="Jason's Photo" />
								<span id="user_info">
									<small>Seja bem vindo,</small>
									${customer.login}
								</span>

								<i class="icon-caret-down"></i>
							</a>

							<ul class="pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-closer" id="user_menu">
								<li>
									<a href="#">
										<i class="icon-cog"></i>
										Configuração
									</a>
								</li>

								<li>
									<a href="#">
										<i class="icon-user"></i>
										Perfil
									</a>
								</li>

								<li class="divider"></li>

								<li>
									<a href="#">
										<i class="icon-off"></i>
										Sair
									</a>
								</li>
							</ul>
						</li>
					</ul><!--/.w8-nav-->
				</div><!--/.container-fluid-->
			</div><!--/.navbar-inner-->
		</div>

		<div class="container-fluid" id="main-container">
			<a id="menu-toggler" href="#">
				<span></span>
			</a>

			<div id="sidebar">
				<div id="sidebar-shortcuts">
					<div id="sidebar-shortcuts-large">
						<button class="btn btn-small btn-success">
							<i class="icon-signal"></i>
						</button>

						<button class="btn btn-small btn-info">
							<i class="icon-pencil"></i>
						</button>

						<button class="btn btn-small btn-warning">
							<i class="icon-group"></i>
						</button>

						<button class="btn btn-small btn-danger">
							<i class="icon-cogs"></i>
						</button>
					</div>

					<div id="sidebar-shortcuts-mini">
						<span class="btn btn-success"></span>

						<span class="btn btn-info"></span>

						<span class="btn btn-warning"></span>

						<span class="btn btn-danger"></span>
					</div>
				</div><!--#sidebar-shortcuts-->

				<ul class="nav nav-list">
					<li class="active">
						<a href="index.html">
							<i class="icon-dashboard"></i>
							<span>Início</span>
						</a>
					</li>
					
					<c:forEach items="${categorys}" var="entry" > 
						<li>		
							<c:choose>
								<c:when test="${fn:length(entry.value) gt 0}">
									<a href="<c:url value="/product/load/${entry.key.id}" />" class="dropdown-toggle" >
										<i class="icon-desktop"></i>
										<span>${entry.key.description}</span>
										<b class="arrow icon-angle-down"></b>
									</a>
									
									<ul class="submenu">
			                   		<c:forEach items="${entry.value}" var="valueListMap"> 
			                        	<li>
											<a href="<c:url value="/product/load/${valueListMap.id}" />">
												<i class="icon-double-angle-right"></i>
													${valueListMap.description}
											</a>
										</li>
			                   		</c:forEach> 
			                   		</ul>									
								</c:when>
								<c:otherwise>
									<li>
										<a href="<c:url value="/product/load/${entry.key.id}" />">
											<i class="icon-text-width" ></i>
											<span>${entry.key.description}</span>
										</a>
									</li>
								</c:otherwise>
							</c:choose>
																								                   		
						</li>
          		   </c:forEach> 
																
				</ul><!--/.nav-list-->

				<div id="sidebar-collapse">
					<i class="icon-double-angle-left"></i>
				</div>
			</div>

			<div id="main-content" class="clearfix">
				<div id="breadcrumbs">
					<ul class="breadcrumb">
						<li>
							<i class="icon-home"></i>
							<a href="#">Início</a>

							<span class="divider">
								<i class="icon-angle-right"></i>
							</span>
						</li>
						<li class="active">Produtos</li>
					</ul><!--.breadcrumb-->

					<div id="nav-search">
						<form class="form-search">
							<span class="input-icon">
								<input type="text" placeholder="Search ..." class="input-small search-query" id="nav-search-input" autocomplete="off" />
								<i class="icon-search" id="nav-search-icon"></i>
							</span>
						</form>
					</div><!--#nav-search-->
				</div>

				<div id="page-content" class="clearfix">
					<div class="page-header position-relative">
						<h1>
							Produtos
							<small>
								<i class="icon-double-angle-right"></i>
								${category.description}
								<i class="icon-double-angle-right"></i>
								Listagem de produtos
							</small>
						</h1>
					</div><!--/.page-header-->

					<div class="row-fluid">
						<!--PAGE CONTENT BEGINS HERE-->

						<div class="alert alert-block alert-success">
							<button type="button" class="close" data-dismiss="alert">
								<i class="icon-remove"></i>
							</button>

							<i class="icon-ok green"></i>

							Seja bem vindo ao
							<strong class="green">
								Catálago VPSA
								<small>(v1.0)</small></strong>, aqui você pode pesquisar os produtos e alterar as informações que serão exibidas ao cliente.
						</div>

						<div class="space-6"></div>
						
							<!-- CONTEUDO -->
							<form class="form-search"  method="get" id="search-produtos">
								<div class="input-append">
								  <input type="text" id="filter-product" class="input-large search-query span2">
									<button type="submit" class="btn" onclick="submitSearch('<c:url value="/filter/" />');">Buscar</button>
								</div>
							</form>

							<c:choose>
								<c:when test="${fn:length(products) > 0}">
									
									<c:forEach var="product" items="${products}">		
										
							    			<div class="span3">			
												
											    	<img src="<c:url value="/assets/img/tv.jpg" />" />
											    	<p>
										
											    		<a class="link" href="<c:url value="/detail/${product.id}" />"><c:out value="${product.description}" /></a>  								
												  		
													</p>
												
											</div>
																			
									</c:forEach>
									
								</c:when>
								<c:when test="${fn:length(products) <= 0}">
									<p>Realize uma busca para encontrar o produto desejado.</p>
								</c:when>
							</c:choose>	

							<c:if test="${numberOfPages > 1 && fn:length(products) > 0}">
								<div class="btn-group">
					
										<c:if test="${currentPage != 1}">
											<a class="btn" href="<c:url value="?page=${prevPage}" />">Anterior</a>
										</c:if>
										<c:if test="${currentPage != numberOfPages}">
											<a class="btn" href="<c:url value="?page=${nextPage}" />">Próximo</a>
										</c:if>
					
								</div>
							</c:if>
							
							
						</div><!--/row-->

						<!--PAGE CONTENT ENDS HERE-->
					</div><!--/row-->
				</div><!--/#page-content-->

				<div id="ace-settings-container">
					<div class="btn btn-app btn-mini btn-warning" id="ace-settings-btn">
						<i class="icon-cog"></i>
					</div>

					<div id="ace-settings-box">
						<div>
							<div class="pull-left">
								<select id="skin-colorpicker" class="hidden">
									<option data-class="default" value="#438EB9">#438EB9</option>
									<option data-class="skin-1" value="#222A2D">#222A2D</option>
									<option data-class="skin-2" value="#C6487E">#C6487E</option>
									<option data-class="skin-3" value="#D0D0D0">#D0D0D0</option>
								</select>
							</div>
							<span>&nbsp; Choose Skin</span>
						</div>

						<div>
							<input type="checkbox" class="ace-checkbox-2" id="ace-settings-header" />
							<label class="lbl" for="ace-settings-header"> Fixed Header</label>
						</div>

						<div>
							<input type="checkbox" class="ace-checkbox-2" id="ace-settings-sidebar" />
							<label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
						</div>
					</div>
				</div><!--/#ace-settings-container-->
			</div><!--/#main-content-->
		</div><!--/.fluid-container#main-container-->

		<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
			<i class="icon-double-angle-up icon-only bigger-110"></i>
		</a>

		<!--basic scripts-->

		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
		
		<script type="text/javascript">
			window.jQuery || document.write("<script src='/catalagovpsa/assets/themes/js/jquery-1.9.1.min.js'>"+"<"+"/script>");
		</script>
		<script src="<c:url value="/assets/bootstrap/js/bootstrap.min.js"/>"></script>
		<script src="<c:url value="/assets/themes/js/jquery-ui-1.10.3.custom.min.js"/>"></script>
		<script src="<c:url value="/assets/themes/js/jquery.ui.touch-punch.min.js"/>"></script>
		
		<script src="<c:url value="/assets/themes/js/jquery.slimscroll.min.js"/>"></script>
		<script src="<c:url value="/assets/themes/js/jquery.easy-pie-chart.min.js"/>"></script>
		<script src="<c:url value="/assets/themes/js/jquery.sparkline.min.js"/>"></script>
		
		<script src="<c:url value="/assets/themes/js/jquery.flot.min.js"/>"></script>
		<script src="<c:url value="/assets/themes/js/jquery.flot.pie.min.js"/>"></script>
		<script src="<c:url value="/assets/themes/js/jquery.flot.resize.min.js"/>"></script>

		<!--w8 scripts-->

		<script src="<c:url value="/assets/themes/js/w8-elements.min.js"/>"></script>
		<script src="<c:url value="/assets/themes/js/w8.min.js"/>"></script>
		
		<script src="<c:url value="/assets/js/events.js" />"></script>				

		<!--inline scripts related to this page-->

		
	</body>
</html>
