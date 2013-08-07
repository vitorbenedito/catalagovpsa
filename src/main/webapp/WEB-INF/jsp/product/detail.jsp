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
 
</custom:main>

