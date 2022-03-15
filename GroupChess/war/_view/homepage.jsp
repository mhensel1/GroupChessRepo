<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
	<head>
		<title>Homepage</title>
	</head>

	<body>
		<form action="${pageContext.servletContext.contextPath}/Login" method="get">
            <input name="login" type="Submit" value="Login">
        </form>
        
        <form action="${pageContext.servletContext.contextPath}/CreateAccount" method="get">
            <input name="createAccount" type="Submit" value="Create Account">
		</form>
	</body>
</html>