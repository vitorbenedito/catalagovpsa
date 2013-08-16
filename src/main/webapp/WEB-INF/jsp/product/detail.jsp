<%@ taglib prefix="authz" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="custom" %>

<custom:main title="Detalhe" selectedItem="${product.description}">

<link href="<c:url value="/assets/css/adipoli.css"/>" rel="stylesheet"/>

	<form>
	 
		<fieldset>	
			<legend>Alteração Produto</legend>																					
		</fieldset>
		<div class="row-fluid">
			<div class="span12">
				<div class="span6">				
					<fieldset>	
						<h4>
							Descrição
						</h4>		
						<label class="radio inline">															
							<input type="radio" name="radioDesc" id="radioDesc1" value="radioDesc1" checked> VPSA
						</label>		
						<label class="radio inline">			
							<input type="radio" name="radioDesc" id="radioDesc2" value="radioDesc2"> Customizado	
						</label>
					</fieldset>																		
					<fieldset>								
						<textarea id="description_vpsa" rows="2" readonly="readonly" >
							${product.description}
						</textarea>
					</fieldset>
					
					<fieldset>	
						<h4>
							Preço
						</h4>		
						<label class="radio inline">															
							<input type="radio" name="radioPreco" id="radioPreco1" value="radioPreco1" checked> VPSA
						</label>		
						<label class="radio inline">			
							<input type="radio" name="radioPreco" id="radioPreco2" value="radioPreco2"> Customizado	
						</label>
					</fieldset>																		
					<fieldset>								
						<input type="text" id="preco" name="preco" value="${product.sellingPrice}"/>				
					</fieldset>
					
					<fieldset>	
						<h4>
							Especificação
						</h4>		
						<label class="radio inline">															
							<input type="radio" name="radioSpec" id="radioSpec1" value="radioSpec1" checked> VPSA
						</label>		
						<label class="radio inline">			
							<input type="radio" name="radioSpec" id="radioSpec2" value="radioSpec2"> Customizado	
						</label>
					</fieldset>																		
					<fieldset>								
						<textarea id="description_vpsa" rows="6" readonly="readonly" >
							${product.specification}
						</textarea>
					</fieldset>
				</div>
				
				<jsp:include page="photo.jsp" />
				
			</div>
		</div>
		<hr/>
		
		<div class="btn-bottom">
			<button type="submit" class="btn">Cancelar</button>
			<button type="submit" class="btn btn-success">Salvar</button>
		</div>
		
	</form>
	
	
	
 
</custom:main>

<div class="modal container fade" id="myModal" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title">Fotos - ${product.description}</h4>
			</div>
			<div class="modal-body custom-height-modal">

				<div id="myCarousel" class="carousel slide">
					
						<div class="carousel-inner">
							<c:forEach items="${photos}" var="entry">
								<c:if test="${entry.fileURL eq firstURL}">
									<div class="item active">
										<div class="principalphoto">
											<img src="${entry.fileURL}" id="principalimgmodal">
										</div>
									</div>
								</c:if>
								<c:if test="${entry.fileURL ne firstURL}">
									<div class="item">
										<img src="${entry.fileURL}" id="principalimgmodal">
									</div>
								</c:if>
							</c:forEach>
						</div>
					
					<a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a> 
					<a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
				</div>

			</div>
			<div class="modal-footer">

				<c:forEach items="${photos}" var="entry" varStatus="count">
					<li class="span1" id="dropzone">
					<a href="#" onmouseover="showImgModal(${count.index})" >
							<c:if test="${not empty entry.thumbnailURL}">
								<img src="${entry.thumbnailURL}" class="img-style row1"
									id="img_mini" alt="foto">
							</c:if> <c:if test="${empty entry.fileURL}">
								<img src="<c:url value="/assets/img/square.gif"/>"
									class="img-style row1" id="img_mini" alt="foto">
							</c:if>
					</a></li>
				</c:forEach>

			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<script src="<c:url value="/assets/js/vendor/jquery.ui.widget.js"/>"></script>
<script src="<c:url value="/assets/js/jquery.iframe-transport.js"/>"></script>
<script src="<c:url value="/assets/js/jquery.fileupload.js"/>"></script>
<script src="<c:url value="/assets/js/myuploadfunction.js"/>" ></script>
<script src="<c:url value="/assets/js/jquery.adipoli.min.js"/>" ></script>

<script>
$(function(){
    $('.row1').adipoli({
        'startEffect' : 'normal',
        'hoverEffect' : 'popout'
    });   
    
});

function showImg(img){
	document.getElementById('principalimg').src = img;
}

function showImgModal(index){
	$('.modal').carousel(index);
}

$('.modal').css({ 
  width: 'auto',
  'margin-left': function () {
     return -($(this).width() / 2);
  }
});



</script> 


