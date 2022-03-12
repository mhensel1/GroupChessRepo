<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
	<head>
		
	</head>

	<body>
        <center>
		<c:if test="${! empty errorMessage}">
			<div class="error">${errorMessage}</div>
		</c:if>
	
		<form action="${pageContext.servletContext.contextPath}/Menu" method="post">
            <input name="loadGame" type="Submit" value="Load Game">
            <input name="findGame" type="Submit" value="Find Game">
            <input name="viewStats" type="Submit" value="View Stats">
            <input name="viewHistory" type="Submit" value="View History">
            <input name="logOut" type="Submit" value="Log Out">
		</form>
            <form action="http://www.uschess.org/index.php/Learn-About-Chess/Learn-to-Play-Chess.html">
                <input type="submit" value="Learn to Play" />
            </form>
        </center>
	</body>
</html>