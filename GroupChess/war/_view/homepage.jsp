<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
	<head>
		<title>Homepage</title>
		<link rel="stylesheet" href="/menuStyle.css" />
		<style>
			input{
				background-color: #C90000;
				color: white;
				font-size: 32px;
				padding: 10px 20px;
				margin-top: 50px;
				margin-left: 30px;
			}
		</style>
	</head>
	
	<body style="background-image: url(https://images3.alphacoders.com/223/thumb-1920-22319.jpg);">
		<form action="${pageContext.servletContext.contextPath}/Login" method="get">
            <input name="login" type="Submit" value="Login">
        </form>
        
        <form action="${pageContext.servletContext.contextPath}/CreateAccount" method="get">
            <input name="createAccount" type="Submit" value="Create Account">
		</form>
	</body>
</html>