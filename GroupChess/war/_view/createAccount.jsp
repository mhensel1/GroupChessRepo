<!DOCTYPE html>
<html>
	<head>
        <title>Create Account</title>
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
	
		<form action="${pageContext.servletContext.contextPath}/CreateAccount" method="post">
				<tr>
				<td class="label">Username:</td>
					<td><input type="text" name="user" size="12" value="${user}" /></td>
				</tr>
				<tr>
					<td class="label">Password:</td>
					<td><input type="password" name="pass" size="12" value="${pass}" /></td>
				</tr>
                <tr>
					<td class="label">Verify Password:</td>
					<td><input type="password" name="pass2" size="12" value="${pass2}" /></td>
				</tr>
			<input type="Submit" name="submit" value="Create Account">
		</form>
        
        <form action="_view/homepage.jsp">
            <input type=submit value="Return to Homepage">
        </form>
	</body>
</html>