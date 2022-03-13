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
		}
		</style>
	</head>

	<body>
        <c:if test="${! empty errorMessage}">
			<div class="error">${errorMessage}</div>
		</c:if>
	
		<form action="${pageContext.servletContext.contextPath}/Menu" method="get">
				<tr>
				<td class="label">Username:</td>
					<td><input type="text" name="username" size="12" value="${ChessUser.user}" /></td>
				</tr>
				<tr>
					<td class="label">Password:</td>
					<td><input type="text" name="pass" size="12" value="${pass}" /></td>
				</tr>
                <tr>
					<td class="label">Verify Password:</td>
					<td><input type="text" name="pass2" size="12" value="${pass2}" /></td>
				</tr>
			<input type="Submit" name="submit" value="Create Account">
		</form>
        
        <form action="_view/homepage.jsp">
            <input type=submit value="Return to Homepage">
        </form>
	</body>
</html>