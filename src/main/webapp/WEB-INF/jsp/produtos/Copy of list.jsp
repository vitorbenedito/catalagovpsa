<%@ taglib prefix="authz"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<title>VPSA - Photo Uploader</title>
<link href="<c:url value="/assets/css/bootstrap.min.css" />" rel="stylesheet" media="screen">
<link href="<c:url value="/assets/css/bootstrap-responsive.min.css" />" rel="stylesheet" media="screen">
<style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
      .sidebar-nav {
        padding: 9px 0;
      }

      @media (max-width: 980px) {
        /* Enable use of floated navbar text */
        .navbar-text.pull-right {
          float: none;
          padding-left: 5px;
          padding-right: 5px;
        }
      }
</style>
<link href="<c:url value="/assets/css/font-awesome.min.css" />" rel="stylesheet" media="screen">
<link href="<c:url value="/assets/css/stage.css" />" rel="stylesheet" media="screen">
<link href="<c:url value="/assets/css/vpsa.css" />" rel="stylesheet" media="screen">
</head>
<body>

	<div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container-fluid">
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="brand" href="#">Project name</a>
          <div class="nav-collapse collapse">
            <p class="navbar-text pull-right">
              Logged in as <a href="#" class="navbar-link">Username</a>
            </p>
            <ul class="nav">
              <li class="active"><a href="#">Home</a></li>
              <li><a href="#about">About</a></li>
              <li><a href="#contact">Contact</a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>

	<div class="container-fluid">
      <div class="row-fluid">
        <div class="span3">
          <div class="well sidebar-nav">
            <ul class="nav nav-list">
              <li class="nav-header">Sidebar</li>
              <li class="active"><a href="#">Link</a></li>
              <li><a href="#">Link</a></li>
              <li><a href="#">Link</a></li>
              <li><a href="#">Link</a></li>
              <li class="nav-header">Sidebar</li>
              <li><a href="#">Link</a></li>
              <li><a href="#">Link</a></li>
              <li><a href="#">Link</a></li>
              <li><a href="#">Link</a></li>
              <li><a href="#">Link</a></li>
              <li><a href="#">Link</a></li>
              <li class="nav-header">Sidebar</li>
              <li><a href="#">Link</a></li>
              <li><a href="#">Link</a></li>
              <li><a href="#">Link</a></li>
            </ul>
          </div><!--/.well -->
        </div><!--/span-->
		<div class="span9">
		
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
	</div><!--/row-->

      <hr>

      <footer>
        <p>&copy; Company 2013</p>
      </footer>

    </div><!--/.fluid-container-->

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