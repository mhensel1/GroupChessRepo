<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<html>
	<head>
        
		<title>
			Game ${game.id}
		</title>
        
        
        
        <style type="text/css">
        	body{
        		background-color: #800202;
        		text-align: center;
        		color: white;
        		font-size: 24px;
                background-image: url(https://images3.alphacoders.com/223/thumb-1920-22319.jpg);
        	}
        input {
				background-color: #C90000;
				color: white;
				font-size: 32px;
				padding: 10px 20px;
				margin-top: 10px;
		}
        .player {
				background-color: #C90000;
				color: white;
				font-size: 32px;
				padding: 3px 5px;
				margin: auto;
                width: 510px;
                text-align: center;
		}
                    .chat {
				width: 260px;
                height: 200px;
                position:absolute;
                margin-left: 25px;
                top:320px;
                left: 10px;
                background-color: whitesmoke;
				border: 5px solid #111;
		}
        .pieces {
				background-color: #C90000;
				 width: 260px;
                height: 300px;
                position:absolute;
                margin-left: 25px;
                top:10px;
                left: 10px;
                background-color: whitesmoke;
				border: 5px solid #111;
		}
        .text{
				width: 260px;
                height: 200px;
                position:absolute;
                margin-left: 25px;
                top:320px;
                left: 10px;
                background-color: whitesmoke;
				border: 5px solid #111;
        }
        .chessboard {
                width: 480px;
                height: 480px;
                margin: auto;
                border: 5px solid #111;
        }
        .space {
                width: 60px;
                height: 60px;
                float: left;
                text-align: center;
                display: table-cell;
                vertical-align:middle;
        }
        .black {
                float: left;
                width: 60px;
                height: 60px;
                background-color: darkred;
                font-size:20px;
                text-align:center;
                display: table-cell;
                vertical-align:middle;
        }
        .white {
                float: left;
                width: 60px;
                height: 60px;
                background-color: #ffd9b3;
                font-size:20px;
                text-align:center;
                display: table-cell;
                vertical-align:middle;
        }
        .input{
				color: white;
                width: 250px;
                height: 360px;
                position: absolute;
                margin-right: 25px;
                top:10px;
                right: 10px;
                background-color: whitesmoke;
				border: 5px solid #111;
		}

        #blackQueen {
              width: 60px;
              height: 60px;
              background: url(_view/chessPieces.png) 0 0;
        }
            
        #blackKing {
              width: 60px;
              height: 60px;
              background: url(_view/chessPieces.png) -60px 0;
        }
            
        #blackRook1 {
              width: 60px;
              height: 60px;
              background: url(_view/chessPieces.png) -120px 0;
        }
            
        #blackRook2 {
              width: 60px;
              height: 60px;
              background: url(_view/chessPieces.png) -120px 0;
        }
        #blackKnight1 {
              width: 60px;
              height: 60px;
              background: url(_view/chessPieces.png) -180px 0;
        }
        #blackKnight2 {
              width: 60px;
              height: 60px;
              background: url(_view/chessPieces.png) -180px 0;
        }
        #blackBishop1 {
              width: 60px;
              height: 60px;
              background: url(_view/chessPieces.png) -240px 0;
        }
        #blackBishop2 {
              width: 60px;
              height: 60px;
              background: url(_view/chessPieces.png) -240px 0;
        }
        #blackPawn1 {
              width: 60px;
              height: 60px;
              background: url(_view/chessPieces.png) -300px 0;
        }
        #blackPawn2 {
              width: 60px;
              height: 60px;
              background: url(_view/chessPieces.png) -300px 0;
        }
        #blackPawn3 {
              width: 60px;
              height: 60px;
              background: url(_view/chessPieces.png) -300px 0;
        }
        #blackPawn4 {
              width: 60px;
              height: 60px;
              background: url(_view/chessPieces.png) -300px 0;
        }
        #blackPawn5 {
              width: 60px;
              height: 60px;
              background: url(_view/chessPieces.png) -300px 0;
        }
        #blackPawn6 {
              width: 60px;
              height: 60px;
              background: url(_view/chessPieces.png) -300px 0;
        }
        #blackPawn7 {
              width: 60px;
              height: 60px;
              background: url(_view/chessPieces.png) -300px 0;
        }
        #blackPawn8 {
              width: 60px;
              height: 60px;
              background: url(_view/chessPieces.png) -300px 0;
        }
        #whiteQueen {
              width: 60px;
              height: 60px;
              background: url(_view/chessPieces.png) 0 -60px;
        }
        #whiteKing {
              width: 60px;
              height: 60px;
              background: url(_view/chessPieces.png) -60px -60px;
        }
        #whiteRook1 {
              width: 60px;
              height: 60px;
              background: url(_view/chessPieces.png) -120px -60px;
        }
        #whiteRook2 {
              width: 60px;
              height: 60px;
              background: url(_view/chessPieces.png) -120px -60px;
        }
        #whiteKnight1 {
              width: 60px;
              height: 60px;
              background: url(_view/chessPieces.png) -180px -60px;
        }
        #whiteKnight2 {
              width: 60px;
              height: 60px;
              background: url(_view/chessPieces.png) -180px -60px;
        }
        #whiteBishop1 {
              width: 60px;
              height: 60px;
              background: url(_view/chessPieces.png) -240px -60px;
        }
        #whiteBishop2 {
              width: 60px;
              height: 60px;
              background: url(_view/chessPieces.png) -240px -60px;
        }
        #whitePawn {
              width: 60px;
              height: 60px;
              background: url(_view/chessPieces.png) -300px -60px;
        }
        #whitePawn1 {
              width: 60px;
              height: 60px;
              background: url(_view/chessPieces.png) -300px -60px;
        }
        #whitePawn2 {
              width: 60px;
              height: 60px;
              background: url(_view/chessPieces.png) -300px -60px;
        }
        #whitePawn3 {
              width: 60px;
              height: 60px;
              background: url(_view/chessPieces.png) -300px -60px;
        }
        #whitePawn4 {
              width: 60px;
              height: 60px;
              background: url(_view/chessPieces.png) -300px -60px;
        }
        #whitePawn5 {
              width: 60px;
              height: 60px;
              background: url(_view/chessPieces.png) -300px -60px;
        }
        #whitePawn6 {
              width: 60px;
              height: 60px;
              background: url(_view/chessPieces.png) -300px -60px;
        }
        #whitePawn7 {
              width: 60px;
              height: 60px;
              background: url(_view/chessPieces.png) -300px -60px;
        }
        #whitePawn8 {
              width: 60px;
              height: 60px;
              background: url(_view/chessPieces.png) -300px -60px;
        }
        </style>
        
        <script>
            
           function allowDrop(event) {
                event.preventDefault();
            }

            function dragStart(event) {
                document.getElementById("form_id").submit();// Form submission
                event.dataTransfer.setData("sprite", event.target.id);
            }

            function dragDrop(event) {
                event.preventDefault();
                var data = event.dataTransfer.getData("sprite");
                event.target.appendChild(document.getElementById(data));
            }
                        
        </script>
   
	</head>
    
    <body>
         <div class="chessboard" id="board">
    	${error}
      	<c:set var="count" value="0" scope="page" />
      	<c:forEach var="num" items="${rows}">
            
      		<form action="${pageContext.servletContext.contextPath}/Game" method="post" class="space"> 
                <c:if test = "${count % 2 == 0}">
            	<input name="0${count}" type="Submit" value="0${count}" class="white">
                 </c:if>
                  <c:if test = "${count % 2 != 0}">
            	<input name="0${count}" type="Submit" value="0${count}" class="black">
                 </c:if>
        	</form>
            
        	<c:set var="count" value="${count + 1}" scope="page"/>
      	</c:forEach>
             
      	
      	<c:set var="count2" value="0" scope="page" />
      	<c:forEach var="num" items="${rows}">
            
      		<form action="${pageContext.servletContext.contextPath}/Game" method="post" class="space">
            	  <c:if test = "${count2 % 2 == 0}">
            	<input name="1${count2}" type="Submit" value="1${count2}" class="black">
                 </c:if>
                  <c:if test = "${count2 % 2 != 0}">
            	<input name="1${count2}" type="Submit" value="1${count2}" class="white">
                 </c:if>
        	</form>
            
        	<c:set var="count2" value="${count2 + 1}" scope="page"/>
      	</c:forEach>
      	
      	<c:set var="count3" value="0" scope="page" />
      	<c:forEach var="num" items="${rows}">
      		<form action="${pageContext.servletContext.contextPath}/Game" method="post" class="space">
                <c:if test = "${count3 % 2 == 0}">
            	<input name="2${count3}" type="Submit" value="2${count3}" class="white">
                 </c:if>
                  <c:if test = "${count3 % 2 != 0}">
            	<input name="2${count3}" type="Submit" value="2${count3}" class="black">
                 </c:if>
        	</form>
        	<c:set var="count3" value="${count3 + 1}" scope="page"/>
      	</c:forEach>
      	
      	<c:set var="count4" value="0" scope="page" />
      	<c:forEach var="num" items="${rows}">
      		<form action="${pageContext.servletContext.contextPath}/Game" method="post" class="space">
            	 <c:if test = "${count4 % 2 == 0}">
            	<input name="3${count4}" type="Submit" value="3${count4}" class="black">
                 </c:if>
                  <c:if test = "${count4 % 2 != 0}">
            	<input name="3${count4}" type="Submit" value= "3${count4}" class="white">
                 </c:if>
        	</form>
        	<c:set var="count4" value="${count4 + 1}" scope="page"/>
      	</c:forEach>
      	
      	<c:set var="count5" value="0" scope="page" />
      	<c:forEach var="num" items="${rows}">
      		<form action="${pageContext.servletContext.contextPath}/Game" method="post" class="space">
            	 <c:if test = "${count5 % 2 == 0}">
            	<input name="4${count5}" type="Submit" value="4${count5}" class="white">
                 </c:if>
                  <c:if test = "${count5 % 2 != 0}">
            	<input name="4${count5}" type="Submit" value= "4${count5}" class="black">
                 </c:if>
        	</form>
        	<c:set var="count5" value="${count5 + 1}" scope="page"/>
      	</c:forEach>
      	
      	<c:set var="count6" value="0" scope="page" />
      	<c:forEach var="num" items="${rows}">
      		<form action="${pageContext.servletContext.contextPath}/Game" method="post" class="space">
             <c:if test = "${count6 % 2 == 0}">
            	<input name="5${count6}" type="Submit" value="5${count6}" class="black">
                 </c:if>
                  <c:if test = "${count6 % 2 != 0}">
            	<input name="5${count6}" type="Submit" value= "5${count6}" class="white">
                 </c:if>
        	</form>
        	<c:set var="count6" value="${count6 + 1}" scope="page"/>
      	</c:forEach>
      	
      	<c:set var="count7" value="0" scope="page" />
      	<c:forEach var="num" items="${rows}">
      		<form action="${pageContext.servletContext.contextPath}/Game" method="post" class="space">
            	 <c:if test = "${count7 % 2 == 0}">
            	<input name="6${count7}" type="Submit" value="6${count7}" class="white">
                 </c:if>
                  <c:if test = "${count7 % 2 != 0}">
            	<input name="6${count7}" type="Submit" value= "6${count7}" class="black">
                 </c:if>
        	</form>
        	<c:set var="count7" value="${count7 + 1}" scope="page"/>
      	</c:forEach>
      	
      	<c:set var="count8" value="0" scope="page" />
      	<c:forEach var="num" items="${rows}">
      		<form action="${pageContext.servletContext.contextPath}/Game" method="post" class="space">
            		 <c:if test = "${count8 % 2 == 0}">
            	<input name="7${count8}" type="Submit" value="7${count8}" class="black">
                 </c:if>
                  <c:if test = "${count8 % 2 != 0}">
            	<input name="7${count8}" type="Submit" value= "7${count8}" class="white">
                 </c:if>
        	</form>
        	<c:set var="count8" value="${count8 + 1}" scope="page"/>
      	</c:forEach>
            
            </div>
        <div class = "input">
      	
      	<form action="${pageContext.servletContext.contextPath}/Game" method="get">
            <input name="endTurn" type="Submit" value="End Turn">
        </form><!-- unnecessary? -->
            
        <form action="${pageContext.servletContext.contextPath}/Game" method="get">
            <input name="saveGame" type="Submit" value="Save Game">
        </form>
        
        <form action="${pageContext.servletContext.contextPath}/History" method="get">
            <input name="viewHistory" type="Submit" value="View History">
		</form>
            
        <form action="${pageContext.servletContext.contextPath}/Menu" method="get">
            <input name="exitGame" type="Submit" value="Exit Game">
        </form>  
            
        <form action="http://www.uschess.org/index.php/Learn-About-Chess/Learn-to-Play-Chess.html">
            <input type="submit" value="Learn to Play" />
        </form>
              </div>
      	
	</body>
</html>