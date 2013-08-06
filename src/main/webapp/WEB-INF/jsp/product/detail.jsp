<%@ taglib prefix="authz" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="custom" %>

<custom:main title="Detalhe" selectedItem="${product.description}">

	<form>
		<fieldset>
			<legend>Legend</legend>
			<div class="form-group">
				<label for="exampleInputEmail">Email address</label> <input
					type="text" class="form-control" id="exampleInputEmail"
					placeholder="Enter email">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword">Password</label> <input
					type="password" class="form-control" id="exampleInputPassword"
					placeholder="Password">
			</div>
			<div class="form-group">
				<label for="exampleInputFile">File input</label> <input type="file"
					id="exampleInputFile">
				<p class="help-block">Example block-level help text here.</p>
			</div>
			<div class="checkbox">
				<label> <input type="checkbox"> Check me out
				</label>
			</div>
			<button type="submit" class="btn btn-default">Submit</button>
		</fieldset>
	</form>

</custom:main>

