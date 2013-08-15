<%@ taglib prefix="authz" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div id="divPhotos" class="span6">

	<div class="row-fluid">

		<span class="file-wrapper"> <input id="fileupload" type="file"
			name="files[]"
			data-url="<c:url value="/adm/product/upload/${product.id}"/>"
			multiple> <span class="button">Escolha as fotos</span>
		</span>
		<hr>
		<div class="principalphoto">
			<img class="imgprincipalphoto" src="${firstURL}" id="principalimg">
		</div>

		<ul class="thumbnails" id="productDiv">
			<c:forEach items="${photos}" var="entry">
				<li class="span1" id="dropzone">
					<a href="#"onmouseover="showImg(this)"> 
						<c:if test="${not empty entry.fileURL}">
							<img src="${entry.fileURL}" class="img-style row1" id="img_mini" alt="foto">
						</c:if> 
						<c:if test="${empty entry.fileURL}">
							<img src="<c:url value="/assets/img/square.gif"/>" class="img-style row1" id="img_mini" alt="foto">
						</c:if>
					</a>
				</li>
			</c:forEach>
		</ul>
	</div>
	
	<table id="uploaded-files">
        <tr>
            <th>File Name</th>
            <th>File Size</th>
            <th>File Type</th>
            <th>Download</th>
        </tr>
    </table>

	<div id="progress" class="progress hide">
		<div class="bar" style="width: 0%;"></div>
	</div>


</div>

