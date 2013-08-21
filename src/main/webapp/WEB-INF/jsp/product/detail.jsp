<%@ taglib prefix="authz" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="custom" %>

<custom:main title="Detalhe" selectedItem="${product.description}">

<link href="<c:url value="/assets/css/adipoli.css"/>" rel="stylesheet"/>
<link href="<c:url value="/assets/css/bootstrap-switch.css"/>" rel="stylesheet"/>
 
<input type="hidden" id="productId" value="${product.id}" />		
	 
		<fieldset>	
			<legend>Alteração Produto</legend>																					
		</fieldset>
		<div class="row-fluid">
		
			<div class="span12">
				<div class="span6">		
				<form>		
					<fieldset>	
						<label>
							<div class="make-switch" data-text-label="Descrição" data-on-label="VPSA" data-off-label="Customizado" id="switchDesc">
	    						<input type="checkbox" id="checkDesc" checked>
							</div>		
						</label>
					</fieldset>																		
					<fieldset>								
						<textarea id="description_vpsa" rows="2" readonly="readonly" >
							${product.description}
						</textarea>
						<textarea id="description" rows="2" class="hide">
							${product.detail.description}
						</textarea>
					</fieldset>
					
					<fieldset>	
						<label>
							<div class="make-switch" data-text-label="Preço de Venda" data-on-label="VPSA" data-off-label="Customizado" id="switchPrice">
	    						<input type="checkbox" id="checkPrice" checked>
							</div>
						</label>	
					</fieldset>																		
					<fieldset>								
						<input type="text" id="sellingPrice_vpsa" name="sellingPrice_vpsa" value="${product.sellingPrice}" readonly="readonly" class="money"/>	
						
						<input type="text" id="sellingPrice" name="sellingPrice" value="${product.detail.sellingPrice}" style="display:none" class="money"/>					
					</fieldset> 
					
					<fieldset>	
						<label>
							<div class="make-switch" data-text-label="Especificação" data-on-label="VPSA" data-off-label="Customizado" id="switchSpecification">
	    						<input type="checkbox" id="checkSpec" checked>
							</div>
						</label>
					</fieldset>																		
					<fieldset>								
						<textarea id="specification_vpsa" rows="6" readonly="readonly" >
							${product.specification}
						</textarea>
						
						<textarea id="specification" rows="6" class="hide" >
							${product.detail.specification}
						</textarea>
					</fieldset>
				</form>
				</div>
				
				<jsp:include page="photo.jsp" />
				
			</div>
		</div>
		<hr/>
		
		<div class="btn-bottom">
			<button type="button" class="btn">Cancelar</button>
			<button type="button" class="btn btn-success" id="salvar">Salvar</button>
		</div>
	
	
 
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
<script src="<c:url value="/assets/js/bootstrap-switch.min.js"/>" ></script>

<script>
$(function(){
    $('.row1').adipoli({
        'startEffect' : 'normal',
        'hoverEffect' : 'popout'
    });
    
    $('#switchDesc').on('switch-change', function (e, data) {
    	
     	if(data.value)
     	{
     		$("#description_vpsa").show();
       		$("#description").hide();	
     	}
     	else
     	{
     		$("#description_vpsa").hide();
       		$("#description").show();		
     	}
    	 
     });
    
    $('#switchPrice').on('switch-change', function (e, data) {
    	
     	if(data.value)
     	{
     		$("#sellingPrice_vpsa").show();
       		$("#sellingPrice").hide();	
     	}
     	else
     	{
     		$("#sellingPrice_vpsa").hide();
       		$("#sellingPrice").show();		
     	}
    	 
     });
    
    $('#switchSpecification').on('switch-change', function (e, data) {
    	
     	if(data.value)
     	{
     		$("#specification_vpsa").show();
       		$("#specification").hide();	
     	}
     	else
     	{
     		$("#specification_vpsa").hide();
       		$("#specification").show();		
     	}
    	 
     });
	
    $("#salvar").click( function(){
    	
    	var detail = new Object(); 
        detail.productId = $("#productId").val();
    	detail.description = $("#description").val();
    	detail.isDescriptionCustomized = $('#switchDesc').bootstrapSwitch('isActive') ? false : true;
    	detail.specification = $("#specification").val();
    	detail.isSpecificationCustomized = $('#switchSpecification').bootstrapSwitch('isActive') ? false : true;

    	if($('#sellingPrice').data('mask').getCleanVal() > 0)
    	{
    		detail.sellingPrice = $('#sellingPrice').val().replace(/\./g, '').replace(/\,/g,".");
    	}

    	detail.isSellingPriceCustomized = $('#switchPrice').bootstrapSwitch('isActive') ? false : true;

    	var jsonvalue = JSON.stringify(detail).replace(/\\t/g,"");
    	
    	$.ajax({ 
    	    url: "/catalagovpsa/adm/product/save/", 
    	    type: 'POST', 
    	    dataType: 'json', 
    	    data: jsonvalue, 
    	    contentType: 'application/json',
    	    mimeType: 'application/json',
    	    success: function(data) { 

    	    },
    	    error:function(data,status,er) { 

    	    }
    	});	
    	
    });
    
});

function showImg(img){
	document.getElementById('principalimg').src = img;
}

function showImgModal(index){
	$('.modal').carousel(index + 1);
}

$('.modal').css({ 
  width: 'auto',
  'margin-left': function () {
     return -($(this).width() / 2);
  }
});



</script> 


