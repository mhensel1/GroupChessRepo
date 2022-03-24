<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
	<head>
		<title>Login</title>
		<style type="text/css">
		.error {
			color: red;
		}
		
		td.label {
			text-align: right;
			color: white;
		}
		body {
			background-image: url(https://images3.alphacoders.com/223/thumb-1920-22319.jpg);
		}
		input{
				background-color: #C90000;
				color: white;
				font-size: 16px;
				padding: 1px 2px;
				margin-top: 50px;
				margin-left: 3px;
		}
		form {
			color: white;
		}
		</style>
	</head>

	<body>
		<c:if test="${! empty errorMessage}">
			<div class="error">${errorMessage}</div>
		</c:if>
	
		<form action="${pageContext.servletContext.contextPath}/Login" method="post">
				<tr>
					<td class="label">Username:</td>
					<td><input type="text" name="user" size="12" value="${user}" /></td>
				</tr>
				<tr>
					<td class="label">Password:</td>
					<td><input type="text" name="pass" size="12" value="${pass}" /></td>
				</tr>
			<input type="Submit" name="submit" value="Login">
		</form>
		
	</body>
</html>