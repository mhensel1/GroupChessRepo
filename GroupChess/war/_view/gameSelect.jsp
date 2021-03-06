<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
	<head>
		<title>Game Select</title>
		
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
		
		<!-- Script not used, saved for reference -->
		<script>
			var x ="", i;
			for (i=1; i<= ${gamesNum}; i++){
				x = x + '<form id = ' + i + ' action = "${pageContext.servletContext.contextPath}/GameSelect" method = "post">';
				x += '<input name = "gamePick"'+i+'"" type = "Submit" value = "GameNum"></form>';
			}
			document.getElementById("games").innHTML = x;
		</script>
	</head>

	<body>
		<c:if test="${! empty errorMessage}">
			<div class="error">${errorMessage}</div>
		</c:if>
		
		
		
		<div class="welcome">Select a Game</div>
		<div id ="games"></div>
	
		<c:set var="count" value="1" scope="page" />
		<c:forEach var="game" items="${games}">
			<form action="${pageContext.servletContext.contextPath}/GameSelect" method="post">
            	<input name="loadGame${count}" type="Submit" value="Game ${count}">
        	</form>
        	<c:set var="count" value="${count + 1}" scope="page"/>
		</c:forEach>
        
       
	</body>
</html>