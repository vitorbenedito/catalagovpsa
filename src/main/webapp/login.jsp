<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="Author" content="VPSA" />
	<meta name="viewport" content="width=960, initial-scale=1.0" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>VPSA | Photo Uploader</title>
	<link rel="shortcut icon" href="<c:url value="/assets/img/fav.ico"/>">
	<link rel="styleSheet" href="<c:url value="/assets/css/bootstrap.min.css"/>">
	<link rel="styleSheet" href="<c:url value="/assets/css/general.css"/>">
	<link rel="styleSheet" href="<c:url value="/assets/css/login.css"/>">
</head>

<c:choose>
    <c:when test="${param.error == 1}">
       <body>
    </c:when>
    <c:otherwise>
        <body onload="document.forms[1].submit();">
    </c:otherwise>
</c:choose>

	<section>
		<form>
		 	<caption></caption>
			
			<center>
				<br><br>
				
				<c:choose>
				    <c:when test="${param.error == 1}">
				       <h2>Acesso negado!</h2>
				       <a href="<c:url value="/"/>">Clique aqui para tentar novamente.</a>
				    </c:when>
				    <c:otherwise>
				        carregando...
				    </c:otherwise>
				</c:choose>
				
			</center>

		</form>
	</section>

	<form action="<c:url value="/login.do"/>" method="post" style="display:none">
		<input type='hidden' name='j_username' value="marissa"/>
		<input type='hidden' name='j_password' value="wombat"/>
	</form>

</body>
</html>