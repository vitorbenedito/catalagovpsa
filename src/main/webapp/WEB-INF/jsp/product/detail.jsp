<%@ taglib prefix="authz" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="custom" %>

<custom:main title="Detalhe" selectedItem="${product.description}">

<link href="<c:url value="/assets/css/adipoli.css"/>" rel="stylesheet"/>

	<form>
	 
		<fieldset>	
			<legend>Altera��o Produto</legend>																					
		</fieldset>
		<div class="row-fluid">
			<div class="span12">
				<div class="span6">				
					<fieldset>	
						<h4>
							Descri��o
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
							Pre�o
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
							Especifica��o
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
	
	
	<div >
	
	

	
	
</div>
 
</custom:main>
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
	document.getElementById('principalimg').src = img.querySelector("#img_mini").src;
}

</script>


