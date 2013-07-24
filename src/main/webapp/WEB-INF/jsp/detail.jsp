<%@ taglib prefix="authz" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:if test="${product == null}">
	<a class="link" onclick="$('#filter-product').focus()">Realize uma busca por produtos ao lado.</a>
</c:if>

<c:if test="${product != null}">
	<form name="form-product-id" id="main-form">
		<input id="fileupload" type="file" name="file" data-url="${pageContext.request.contextPath}/file?product-id=${product.id}" multiple style="opacity: 0; filter:alpha(opacity: 0);">
	</form>
	<h2 id="title"><c:out value="${product.description}"></c:out></h2>
	
	<c:choose>
	      <c:when test="${fn:length(photos) < 5}">
			<button id="btn-upload" class="btn btn-primary btn-large">Escolher Fotos</button> ou (Arraste as fotos)
			<div id="dropbox" class="upload">
	      </c:when>
	      <c:otherwise>
			<div class="upload">
	      </c:otherwise>
	</c:choose>
	
		<c:choose>

			<c:when test="${fn:length(photos) == 0}">
				<p>Nenhuma foto cadastrada ainda, arraste ou escolha uma foto no botão acima.</p>
			</c:when>	
		
			<c:when test="${fn:length(photos) >= 5}">
				<ul class="thumbnails">
					<c:forEach var="photo" items="${photos}">
						<li class="span3">
							<a href="#" class="thumbnail">
								<img src="${photo.url}" alt="Foto para ${product.description}">
							</a>
							<a class="btn btn-primary btn-small remove"  href="<c:url value="/delete/${product.id}/${photo.id}/" />">Remover</a>
						</li>
					</c:forEach>
				</ul>
			</c:when>
		
			<c:when test="${fn:length(photos) < 5}">
				<ul class="thumbnails">
					<c:forEach var="photo" items="${photos}">
						<li class="span3">
							<a href="#" class="thumbnail">
								<img src="${photo.url}" alt="Foto para ${product.description}">
							</a>
							<a class="btn btn-primary btn-small remove"  href="<c:url value="/delete/${product.id}/${photo.id}/" />">Remover</a>
						</li>
					</c:forEach>
				</ul>
			</c:when>
	
		</c:choose>
	</div>
	
	<div style="display: none;" class="progress progress-striped active">
		<div class="bar" style="width: 100%;"></div>
	</div>
</c:if>