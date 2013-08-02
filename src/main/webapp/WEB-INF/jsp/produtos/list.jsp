<%@ taglib prefix="authz" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="custom" %>

<custom:main title="Listagem de Produtos" selectedItem="${category.description}">
	<div class="form-search">
		<div class="input-append">
		<button type="button" class="btn" >Buscar</button>
			<input type="text" id="search" class="input-large search-query span2"
				type="text" />
		</div>	
	</div> 
	<c:choose>
		<c:when test="${fn:length(products) > 0}">
			<div class="row-fluid">
				<ul class="thumbnails" id="productDiv">
					<c:forEach var="product" items="${products}">
						<li class="span3"><img
							src="<c:url value="/assets/img/tv.jpg" />" />
							<p>
								<a class="link" href="<c:url value="/detail/${product.id}" />"><c:out
										value="${product.description}" /></a>
							</p></li>
					</c:forEach>
				</ul>
			</div>
	
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
</custom:main>

