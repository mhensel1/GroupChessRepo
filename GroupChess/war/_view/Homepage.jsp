<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
	<head>
		<title>Homepage</title>
	</head>

	<body>
		<form action="${pageContext.servletContext.contextPath}/Homepage" method="post">
			
            <input name="login" type="Submit" value="Login">
            <input name="createAccount" type="Submit" value="Create Account">
            <input name="guessingGame" type="Submit" value="Guessing Game">
            
		</form>
	</body>
</html>