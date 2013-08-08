<%@ taglib prefix="authz" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="custom" %>

<custom:main title="Detalhe" selectedItem="${product.description}">


	<form>
		
			<legend>Alteração produto</legend>																					
						
			<div class="form-group">		
				<div class="radio">																										
					<label >						
						Descrição VPSA										
						<input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>
					</label>					
				</div>										
				<textarea id="description_vpsa" rows="4" readonly="readonly" >
					${product.description}
				</textarea>
			</div>
			<div class="form-group">			
				<div class="radio">																										
					<label >						
						Descrição										
						<input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>
					</label>					
				</div>					 
				<textarea class="form-control" id="description" rows="4" >
					${product.description}
				</textarea>
			</div>
						
			<button type="submit" class="btn btn-default">Salvar</button>
		
	</form>
	
	<img src="<c:url value="/adm/product/get/1/${product.id}"/>">
	
	<div style="width:500px;padding:20px">

	<input id="fileupload" type="file" name="files[]" data-url="<c:url value="/adm/product/upload/${product.id}"/>" multiple>
	
	<div >
		<div id="dropzone" class="fade well">Foto 1</div>
		
		<div id="dropzone" class="fade well">Foto 2</div>
		
		<div id="dropzone" class="fade well">Foto 3</div>
		
		<div id="dropzone" class="fade well">Foto 4</div>
		
		<div id="dropzone" class="fade well">Foto 4</div>
	</div>
	
	<div id="progress" class="progress">
    	<div class="bar" style="width: 0%;"></div>
	</div>

	<table id="uploaded-files" class="table">
		<tr>
			<th>Arquivo</th>
			<th>Tamanho</th>
			<th>Tipo</th>
			<th>Download</th>
		</tr>
	</table>
	
</div>
 
</custom:main>
<script src="<c:url value="/assets/js/vendor/jquery.ui.widget.js"/>"></script>
<script src="<c:url value="/assets/js/jquery.iframe-transport.js"/>"></script>
<script src="<c:url value="/assets/js/jquery.fileupload.js"/>"></script>
<script src="<c:url value="/assets/js/myuploadfunction.js"/>" ></script>

