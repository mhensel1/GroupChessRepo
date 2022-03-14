<!DOCTYPE html>

<html>
	<head>
		<title>
			Game ${game.id}
		</title>
	</head>
	
	<body>
        <div>
			User #1 Turn
		</div>
		<div>
			<img src="/Chessboard.png" alt="Chessboard">
		</div>
		<div>
            <form action="${pageContext.servletContext.contextPath}/Game" method="post">
            <input name="endTurn" type="Submit" value="End Turn">
            <input name="saveGame" type="Submit" value="Save Game">
            <input name="viewHistory" type="Submit" value="View History">
            <input name="exitGame" type="Submit" value="Exit Game">
		</form>
		</div>
	</body>
</html>