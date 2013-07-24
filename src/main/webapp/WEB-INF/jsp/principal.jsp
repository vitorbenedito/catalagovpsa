<%@ taglib prefix="authz" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<title>VPSA - Photo Uploader</title>
<link href="<c:url value="/assets/css/bootstrap.min.css" />" rel="stylesheet" media="screen">
<link href="<c:url value="/assets/css/bootstrap-responsive.min.css" />" rel="stylesheet" media="screen">
<link href="<c:url value="/assets/css/font-awesome.min.css" />" rel="stylesheet" media="screen">
<link href="<c:url value="/assets/css/stage.css" />" rel="stylesheet" media="screen">
<link href="<c:url value="/assets/css/vpsa.css" />" rel="stylesheet" media="screen">
</head>
<body>

	<header class="stage-header">
		<div class="stage-header-upper">
			<div class="header-upper-item ">
				<div class="align-left">
					<img alt="logo" width="83px" height="31px" src="<c:url value="/assets/img/logo.svg"></c:url>">
				</div>
			</div>
			<div class="header-upper-item align-center">VPSA Photo Uploader</div>
			<div class="header-upper-item">
				<div class="align-right">
					<a href="<c:url value="/logout.do" />"><icon class="icon icon-off"></icon></a>
				</div> 
			</div>
		</div>
	</header>

	<hr class="no-margin">

    <div class="content">
      	<div class="aside">

			<form class="form-search"  method="get" id="search-produtos">
				<div class="input-append">
				  <input type="text" id="filter-product" class="input-large search-query span2">
					<button type="submit" class="btn" onclick="submitSearch('<c:url value="/filter/" />');">Buscar</button>
				</div>
			</form>

			<ul class="nav nav-tabs">
				<c:choose>
					<c:when test="${fn:length(products) > 0}">
						<c:forEach var="product" items="${products}">
							<li><a class="link" href="<c:url value="/detail/${product.id}" />"><c:out value="${product.description}" /></a></li>
						</c:forEach>
					</c:when>
					<c:when test="${fn:length(products) <= 0}">
						<p>Realize uma busca para encontrar o produto desejado.</p>
					</c:when>
				</c:choose>
			</ul>

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

	</div>
   	<div class="main">
		<div class="tab-content">
				<div class="tab-pane active">
					<%@include file="detail.jsp"%>
				</div>
			</div>
	</div>
   		
    </div>

	<!--[if lt IE 9]>
      <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

<!-- 	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script> -->
	<script src="<c:url value="/assets/js/jquery.min.js" />"></script>
	<script src="<c:url value="/assets/js/vendor/jquery.ui.widget.js" />"></script>
	<script src="<c:url value="/assets/js/jquery.iframe-transport.js" />"></script>
	<script src="<c:url value="/assets/js/jquery.fileupload.js" />"></script>
	<script src="<c:url value="/assets/js/jquery.loadmask.min.js" />"></script>
	<script src="<c:url value="/assets/js/bootstrap.min.js" />"></script>
	<script src="<c:url value="/assets/js/events.js" />"></script>

</body>
</html>