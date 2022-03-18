<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
	<head>
		<title>Chess Stats</title>
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
		Stats for ${user}
		<c:if test="${! empty result}">
			<div class="seeRank">Rank of ${username}: ${result}</div>
		</c:if>
		
		<c:if test="${empty result}">
			<div class="seeRank">You haven't played any games yet</div>
		</c:if>
		<form action="_view/menu.jsp">
            <input type=submit value="Return to Menu">
        </form>
	</body>
</html>