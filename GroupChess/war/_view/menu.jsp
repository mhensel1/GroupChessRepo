<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
	<head>
		<title>Menu</title>
		
		<style>
			body{
				text-align: center;
				background-image: url(https://images3.alphacoders.com/223/thumb-1920-22319.jpg);
				color: white;
				font-size: 30px;
				font-family: Comic Sans MS;
			}
			input{
				background-color: #C90000;
				color: white;
				font-size: 16px;
				padding: 1px 2px;
				margin-top: 10px;
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
		
		<div class="welcome">Welcome ${user}</div>
		<form action="${pageContext.servletContext.contextPath}/Game" method="get">
            <input name="loadGame" type="Submit" value="Load Game">
            	</form>
        
        <form action="${pageContext.servletContext.contextPath}/Game" method="get">
            <input name="findGame" type="Submit" value="Find Game">
            </form>
        
            <form action="${pageContext.servletContext.contextPath}/History" method="get">
            <input name="viewHistory" type="Submit" value="View History">
            </form>    
                
            <form action="${pageContext.servletContext.contextPath}/Login" method="get">
            <input name="logOut" type="Submit" value="Log Out">
		</form>
		
		<form action="${pageContext.servletContext.contextPath}/Stats" method="get">
			<input name="viewStats" type="Submit" value="ViewStats">
		</form>
		
            <form action="http://www.uschess.org/index.php/Learn-About-Chess/Learn-to-Play-Chess.html">
                <input type="submit" value="Learn to Play" />
            </form>
	</body>
</html>