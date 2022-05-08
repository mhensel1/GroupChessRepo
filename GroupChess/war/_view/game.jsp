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
        .selected {
				width: 260px;
                height: 25px;
                background-color: #C90000;
				border: 3px solid #111;
                color: white;
                top: 75px;
                margin-left: 575px;
                
		}
        .pieces {
				width: 280px;
                height: 360px;
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
                background: url(_view/Chessboard.png) 0 0;
        }
        .Cpieces {
                position: relative;
                top: -10px;  
                right: -3;
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
		.errorM{
				width: 260px;
                height: 25px;
                background-color: #C90000;
				border: 3px solid #111;
                color: white;
                top: 575px;
                margin-left: 575px;
				
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
        #blackRook {
              width: 60px;
              height: 60px;
              background: url(_view/chessPieces.png) -120px 0;
        }
        #blackKnight {
              width: 60px;
              height: 60px;
              background: url(_view/chessPieces.png) -180px 0;
        }
        #blackBishop {
              width: 60px;
              height: 60px;
              background: url(_view/chessPieces.png) -240px 0;
        }
        #blackPawn {
              width: 60px;
              height: 60px;
              background: url(_view/chessPieces.png) -302px 0;
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
        #whiteRook {
              width: 60px;
              height: 60px;
              background: url(_view/chessPieces.png) -120px -60px;
        }
        #whiteKnight {
              width: 60px;
              height: 60px;
              background: url(_view/chessPieces.png) -180px -60px;
        }
        #whiteBishop {
              width: 60px;
              height: 60px;
              background: url(_view/chessPieces.png) -240px -60px;
        }
        #whitePawn {
              width: 60px;
              height: 60px;
              background: url(_view/chessPieces.png) -302px -60px;
        }
            
        </style>
   
	</head>
    
    <body>
        <div class ="player">
			 <c:if test = "${turns % 2 == 0}">
                     White Player Turn           
            </c:if> 
            <c:if test = "${turns % 2 != 0}">
                     Black Player Turn           
            </c:if>
		</div>
        
        <div class = "selected">
			Piece Selected: ${hasSelected}
		</div>
        
        <div class="pieces" >
            <div style="height: 32px; background-color: #C90000;border: 3px solid #111;  color: black;
				font-size: 28px;">
                Captured Pieces
                <div>
                  <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.captured == 'true'}">
                        <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="0${count}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" >
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="0${count}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" >
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" >
                                </c:if> 
                            </c:if>            
                    </c:if> 
                  </c:forEach> 
                    </div>
            </div>
           
        </div>
        
        <div class="chessboard" id="board">
            <div class="Cpieces">
            
            <!--  Row 1  -->    
            <c:set var="count" value="0" scope="page" />
            <c:forEach var="num" items="${rows}">
                <form action="${pageContext.servletContext.contextPath}/Game" method="post" class="space" >   
                    <c:if test = "${count == 0}">
                    <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 0}"> 
                        <c:if test = "${piece.posY == 0}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="0${count}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="0${count}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="0${count}" type="Submit" value="0${count}" class="white">
                    </c:if>  
                    </c:if>

                    <c:if test = "${count - 1 == 0}">
                           <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 0}"> 
                        <c:if test = "${piece.posY == 1}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="0${count}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="0${count}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="0${count}" type="Submit" value="0${count}" class="black">
                    </c:if> 
                    </c:if>

                    <c:if test = "${count - 2 == 0}">
                    <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 0}"> 
                        <c:if test = "${piece.posY == 2}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="0${count}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="0${count}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="0${count}" type="Submit" value="0${count}" class="white">
                    </c:if>  
                    </c:if>

                    <c:if test = "${count - 3 == 0}">
                    <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 0}"> 
                        <c:if test = "${piece.posY == 3}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="0${count}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="0${count}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="0${count}" type="Submit" value="0${count}" class="black">
                    </c:if> 
                    </c:if>

                      <c:if test = "${count - 4 == 0}">
                        <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 0}"> 
                        <c:if test = "${piece.posY == 4}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="0${count}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="0${count}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="0${count}" type="Submit" value="0${count}" class="white">
                    </c:if>  
                    </c:if>

                    <c:if test = "${count - 5 == 0}">
                    <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 0}"> 
                        <c:if test = "${piece.posY == 5}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="0${count}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="0${count}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="0${count}" type="Submit" value="0${count}" class="black">
                    </c:if> 
                    </c:if>

                    <c:if test = "${count - 6 == 0}">
                        <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 0}"> 
                        <c:if test = "${piece.posY == 6}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="0${count}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="0${count}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="0${count}" type="Submit" value="0${count}" class="white">
                    </c:if>  
                    </c:if>

                    <c:if test = "${count - 7 == 0}">
                    <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 0}"> 
                        <c:if test = "${piece.posY == 7}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="0${count}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="0${count}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="0${count}" type="Submit" value="0${count}" class="black">
                    </c:if> 
                    </c:if>

                    <c:if test = "${count - 8 == 0}">
                        <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 0}"> 
                        <c:if test = "${piece.posY == 8}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="0${count}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="0${count}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="0${count}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="0${count}" type="Submit" value="0${count}" class="white">
                    </c:if>  
                    </c:if>

                </form>
            <c:set var="count" value="${count + 1}" scope="page"/>
            </c:forEach>

            <!--  Row 2  -->      
            <c:set var="count2" value="0" scope="page" />
            <c:forEach var="num" items="${rows}">

                <form action="${pageContext.servletContext.contextPath}/Game" method="post" class="space" >   
                    <c:if test = "${count2 == 0}">
                    <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 1}"> 
                        <c:if test = "${piece.posY == 0}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="1${count2}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="1${count2}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="1${count2}" type="Submit" value="1${count2}" class="black">
                    </c:if>  
                    </c:if>

                    <c:if test = "${count2 - 1 == 0}">
                           <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 1}"> 
                        <c:if test = "${piece.posY == 1}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="1${count2}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="1${count2}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="1${count2}" type="Submit" value="1${count2}" class="white">
                    </c:if> 
                    </c:if>

                    <c:if test = "${count2 - 2 == 0}">
                    <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 1}"> 
                        <c:if test = "${piece.posY == 2}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="1${count2}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="1${count2}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="1${count2}" type="Submit" value="1${count2}" class="black">
                    </c:if>  
                    </c:if>

                    <c:if test = "${count2 - 3 == 0}">
                    <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 1}"> 
                        <c:if test = "${piece.posY == 3}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="1${count2}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="1${count2}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="1${count2}" type="Submit" value="1${count2}" class="white">
                    </c:if> 
                    </c:if>

                      <c:if test = "${count2 - 4 == 0}">
                        <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 1}"> 
                        <c:if test = "${piece.posY == 4}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="1${count2}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="1${count2}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="1${count2}" type="Submit" value="1${count2}" class="black">
                    </c:if>  
                    </c:if>

                    <c:if test = "${count2 - 5 == 0}">
                    <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 1}"> 
                        <c:if test = "${piece.posY == 5}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="1${count2}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="1${count2}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="1${count2}" type="Submit" value="1${count2}" class="white">
                    </c:if> 
                    </c:if>

                    <c:if test = "${count2 - 6 == 0}">
                        <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 1}"> 
                        <c:if test = "${piece.posY == 6}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="1${count2}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="1${count2}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="1${count2}" type="Submit" value="1${count2}" class="black">
                    </c:if>  
                    </c:if>

                    <c:if test = "${count2 - 7 == 0}">
                    <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 1}"> 
                        <c:if test = "${piece.posY == 7}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="1${count2}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="1${count2}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="1${count2}" type="Submit" value="1${count2}" class="white">
                    </c:if> 
                    </c:if>

                    <c:if test = "${count2 - 8 == 0}">
                        <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 1}"> 
                        <c:if test = "${piece.posY == 8}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="1${count2}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="1${count2}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="1${count2}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="1${count2}" type="Submit" value="1${count2}" class="black">
                    </c:if>  
                    </c:if>
                </form>

                <c:set var="count2" value="${count2 + 1}" scope="page"/>
            </c:forEach>

            <!--  Row 3  -->      
            <c:set var="count3" value="0" scope="page" />
            <c:forEach var="num" items="${rows}">

                <form action="${pageContext.servletContext.contextPath}/Game" method="post" class="space" >   
                    <c:if test = "${count3 == 0}">
                    <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 2}"> 
                        <c:if test = "${piece.posY == 0}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="2${count3}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="2${count3}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="2${count3}" type="Submit" value="2${count3}" class="white">
                    </c:if>  
                    </c:if>

                    <c:if test = "${count3 - 1 == 0}">
                           <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 2}"> 
                        <c:if test = "${piece.posY == 1}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="2${count3}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="2${count3}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="2${count3}" type="Submit" value="2${count3}" class="black">
                    </c:if> 
                    </c:if>

                    <c:if test = "${count3 - 2 == 0}">
                    <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 2}"> 
                        <c:if test = "${piece.posY == 2}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="2${count3}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="2${count3}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="2${count3}" type="Submit" value="2${count3}" class="white">
                    </c:if>  
                    </c:if>

                    <c:if test = "${count3 - 3 == 0}">
                    <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 2}"> 
                        <c:if test = "${piece.posY == 3}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="2${count3}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="2${count3}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="2${count3}" type="Submit" value="2${count3}" class="black">
                    </c:if> 
                    </c:if>

                      <c:if test = "${count3 - 4 == 0}">
                        <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 2}"> 
                        <c:if test = "${piece.posY == 4}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="2${count3}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="2${count3}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="2${count3}" type="Submit" value="2${count3}" class="white">
                    </c:if>  
                    </c:if>

                    <c:if test = "${count3 - 5 == 0}">
                    <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 2}"> 
                        <c:if test = "${piece.posY == 5}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="2${count3}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="2${count3}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="2${count3}" type="Submit" value="2${count3}" class="black">
                    </c:if> 
                    </c:if>

                    <c:if test = "${count3 - 6 == 0}">
                        <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 2}"> 
                        <c:if test = "${piece.posY == 6}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="2${count3}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="2${count3}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="2${count3}" type="Submit" value="2${count3}" class="white">
                    </c:if>  
                    </c:if>

                    <c:if test = "${count3 - 7 == 0}">
                    <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 2}"> 
                        <c:if test = "${piece.posY == 7}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="2${count3}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="2${count3}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="2${count3}" type="Submit" value="2${count3}" class="black">
                    </c:if> 
                    </c:if>

                    <c:if test = "${count3 - 8 == 0}">
                        <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 2}"> 
                        <c:if test = "${piece.posY == 8}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="2${count3}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="2${count3}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="2${count3}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="2${count3}" type="Submit" value="2${count3}" class="white">
                    </c:if>  
                    </c:if>
                </form>

                <c:set var="count3" value="${count3 + 1}" scope="page"/>
            </c:forEach>

            <!--  Row 4  -->  
            <c:set var="count4" value="0" scope="page" />
            <c:forEach var="num" items="${rows}">

                <form action="${pageContext.servletContext.contextPath}/Game" method="post" class="space" >   
                    <c:if test = "${count4 == 0}">
                    <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 3}"> 
                        <c:if test = "${piece.posY == 0}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="3${count4}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="3${count4}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="3${count4}" type="Submit" value="3${count4}" class="black">
                    </c:if>  
                    </c:if>

                    <c:if test = "${count4 - 1 == 0}">
                           <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 3}"> 
                        <c:if test = "${piece.posY == 1}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="3${count4}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="3${count4}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="3${count4}" type="Submit" value="3${count4}" class="white">
                    </c:if> 
                    </c:if>

                    <c:if test = "${count4 - 2 == 0}">
                    <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 3}"> 
                        <c:if test = "${piece.posY == 2}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="3${count4}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="3${count4}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="3${count4}" type="Submit" value="3${count4}" class="black">
                    </c:if>  
                    </c:if>

                    <c:if test = "${count4 - 3 == 0}">
                    <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 3}"> 
                        <c:if test = "${piece.posY == 3}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="3${count4}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="3${count4}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="3${count4}" type="Submit" value="3${count4}" class="white">
                    </c:if> 
                    </c:if>

                      <c:if test = "${count4 - 4 == 0}">
                        <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 3}"> 
                        <c:if test = "${piece.posY == 4}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="3${count4}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="3${count4}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="3${count4}" type="Submit" value="3${count4}" class="black">
                    </c:if>  
                    </c:if>

                    <c:if test = "${count4 - 5 == 0}">
                    <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 3}"> 
                        <c:if test = "${piece.posY == 5}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="3${count4}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="3${count4}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="3${count4}" type="Submit" value="3${count4}" class="white">
                    </c:if> 
                    </c:if>

                    <c:if test = "${count4 - 6 == 0}">
                        <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 3}"> 
                        <c:if test = "${piece.posY == 6}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="3${count4}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="3${count4}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="3${count4}" type="Submit" value="3${count4}" class="black">
                    </c:if>  
                    </c:if>

                    <c:if test = "${count4 - 7 == 0}">
                    <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 3}"> 
                        <c:if test = "${piece.posY == 7}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="3${count4}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="3${count4}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="3${count4}" type="Submit" value="3${count4}" class="white">
                    </c:if> 
                    </c:if>

                    <c:if test = "${count4 - 8 == 0}">
                        <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 3}"> 
                        <c:if test = "${piece.posY == 8}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="3${count4}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="3${count4}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="3${count4}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="3${count4}" type="Submit" value="3${count4}" class="black">
                    </c:if>  
                    </c:if>
                </form>

                <c:set var="count4" value="${count4 + 1}" scope="page"/>
            </c:forEach>

            <!--  Row 5  -->      
            <c:set var="count5" value="0" scope="page" />
            <c:forEach var="num" items="${rows}">
                <form action="${pageContext.servletContext.contextPath}/Game" method="post" class="space" >   
                    <c:if test = "${count5 == 0}">
                    <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 4}"> 
                        <c:if test = "${piece.posY == 0}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="4${count5}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="4${count5}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="4${count5}" type="Submit" value="4${count5}" class="white">
                    </c:if>  
                    </c:if>

                    <c:if test = "${count5 - 1 == 0}">
                           <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 4}"> 
                        <c:if test = "${piece.posY == 1}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="4${count5}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="4${count5}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="4${count5}" type="Submit" value="4${count5}" class="black">
                    </c:if> 
                    </c:if>

                    <c:if test = "${count5 - 2 == 0}">
                    <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 4}"> 
                        <c:if test = "${piece.posY == 2}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="4${count5}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="4${count5}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="4${count5}" type="Submit" value="4${count5}" class="white">
                    </c:if>  
                    </c:if>

                    <c:if test = "${count5 - 3 == 0}">
                    <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 4}"> 
                        <c:if test = "${piece.posY == 3}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="4${count5}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="4${count5}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="4${count5}" type="Submit" value="4${count5}" class="black">
                    </c:if> 
                    </c:if>

                      <c:if test = "${count5 - 4 == 0}">
                        <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 4}"> 
                        <c:if test = "${piece.posY == 4}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="4${count5}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="4${count5}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="4${count5}" type="Submit" value="4${count5}" class="white">
                    </c:if>  
                    </c:if>

                    <c:if test = "${count5 - 5 == 0}">
                    <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 4}"> 
                        <c:if test = "${piece.posY == 5}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="4${count5}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="4${count5}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="4${count5}" type="Submit" value="4${count5}" class="black">
                    </c:if> 
                    </c:if>

                    <c:if test = "${count5 - 6 == 0}">
                        <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 4}"> 
                        <c:if test = "${piece.posY == 6}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="4${count5}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="4${count5}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="4${count5}" type="Submit" value="4${count5}" class="white">
                    </c:if>  
                    </c:if>

                    <c:if test = "${count5 - 7 == 0}">
                    <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 4}"> 
                        <c:if test = "${piece.posY == 7}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="4${count5}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="4${count5}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="4${count5}" type="Submit" value="4${count5}" class="black">
                    </c:if> 
                    </c:if>

                    <c:if test = "${count5 - 8 == 0}">
                        <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 4}"> 
                        <c:if test = "${piece.posY == 8}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="4${count5}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="4${count5}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="4${count5}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="4${count5}" type="Submit" value="4${count5}" class="white">
                    </c:if>  
                    </c:if>
                </form>
                <c:set var="count5" value="${count5 + 1}" scope="page"/>
            </c:forEach>

            <!--  Row 6  -->      
            <c:set var="count6" value="0" scope="page" />
            <c:forEach var="num" items="${rows}">
                <form action="${pageContext.servletContext.contextPath}/Game" method="post" class="space" >   
                    <c:if test = "${count6 == 0}">
                    <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 5}"> 
                        <c:if test = "${piece.posY == 0}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="5${count6}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="5${count6}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="5${count6}" type="Submit" value="5${count6}" class="black">
                    </c:if>  
                    </c:if>

                    <c:if test = "${count6 - 1 == 0}">
                           <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 5}"> 
                        <c:if test = "${piece.posY == 1}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="5${count6}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="5${count6}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="5${count6}" type="Submit" value="5${count6}" class="white">
                    </c:if> 
                    </c:if>

                    <c:if test = "${count6 - 2 == 0}">
                    <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 5}"> 
                        <c:if test = "${piece.posY == 2}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="5${count6}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="5${count6}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="5${count6}" type="Submit" value="5${count6}" class="black">
                    </c:if>  
                    </c:if>

                    <c:if test = "${count6 - 3 == 0}">
                    <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 5}"> 
                        <c:if test = "${piece.posY == 3}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="5${count6}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="5${count6}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="5${count6}" type="Submit" value="5${count6}" class="white">
                    </c:if> 
                    </c:if>

                      <c:if test = "${count6 - 4 == 0}">
                        <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 5}"> 
                        <c:if test = "${piece.posY == 4}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="5${count6}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="5${count6}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="5${count6}" type="Submit" value="5${count6}" class="black">
                    </c:if>  
                    </c:if>

                    <c:if test = "${count6 - 5 == 0}">
                    <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 5}"> 
                        <c:if test = "${piece.posY == 5}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="5${count6}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="5${count6}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="5${count6}" type="Submit" value="5${count6}" class="white">
                    </c:if> 
                    </c:if>

                    <c:if test = "${count6 - 6 == 0}">
                        <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 5}"> 
                        <c:if test = "${piece.posY == 6}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="5${count6}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="5${count6}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="5${count6}" type="Submit" value="5${count6}" class="black">
                    </c:if>  
                    </c:if>

                    <c:if test = "${count6 - 7 == 0}">
                    <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 5}"> 
                        <c:if test = "${piece.posY == 7}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="5${count6}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="5${count6}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="5${count6}" type="Submit" value="5${count6}" class="white">
                    </c:if> 
                    </c:if>

                    <c:if test = "${count6 - 8 == 0}">
                        <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 5}"> 
                        <c:if test = "${piece.posY == 8}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="5${count6}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="5${count6}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="5${count6}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="5${count6}" type="Submit" value="5${count6}" class="black">
                    </c:if>  
                    </c:if>
                </form>
                <c:set var="count6" value="${count6 + 1}" scope="page"/>
            </c:forEach>

            <!--  Row 7  -->      
            <c:set var="count7" value="0" scope="page" />
            <c:forEach var="num" items="${rows}">
                <form action="${pageContext.servletContext.contextPath}/Game" method="post" class="space" >   
                    <c:if test = "${count7 == 0}">
                    <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 6}"> 
                        <c:if test = "${piece.posY == 0}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="6${count7}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="6${count7}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="6${count7}" type="Submit" value="6${count7}" class="white">
                    </c:if>  
                    </c:if>

                    <c:if test = "${count7 - 1 == 0}">
                           <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 6}"> 
                        <c:if test = "${piece.posY == 1}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="6${count7}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="6${count7}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="6${count7}" type="Submit" value="6${count7}" class="black">
                    </c:if> 
                    </c:if>

                    <c:if test = "${count7 - 2 == 0}">
                    <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 6}"> 
                        <c:if test = "${piece.posY == 2}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="6${count7}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="6${count7}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="6${count7}" type="Submit" value="6${count7}" class="white">
                    </c:if>  
                    </c:if>

                    <c:if test = "${count7 - 3 == 0}">
                    <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 6}"> 
                        <c:if test = "${piece.posY == 3}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="6${count7}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="6${count7}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="6${count7}" type="Submit" value="6${count7}" class="black">
                    </c:if> 
                    </c:if>

                      <c:if test = "${count7 - 4 == 0}">
                        <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 6}"> 
                        <c:if test = "${piece.posY == 4}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="6${count7}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="6${count7}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="6${count7}" type="Submit" value="6${count7}" class="white">
                    </c:if>  
                    </c:if>

                    <c:if test = "${count7 - 5 == 0}">
                    <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 6}"> 
                        <c:if test = "${piece.posY == 5}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="6${count7}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="6${count7}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="6${count7}" type="Submit" value="6${count7}" class="black">
                    </c:if> 
                    </c:if>

                    <c:if test = "${count7 - 6 == 0}">
                        <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 6}"> 
                        <c:if test = "${piece.posY == 6}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="6${count7}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="6${count7}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="6${count7}" type="Submit" value="6${count7}" class="white">
                    </c:if>  
                    </c:if>

                    <c:if test = "${count7 - 7 == 0}">
                    <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 6}"> 
                        <c:if test = "${piece.posY == 7}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="6${count7}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="6${count7}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="6${count7}" type="Submit" value="6${count7}" class="black">
                    </c:if> 
                    </c:if>

                    <c:if test = "${count7 - 8 == 0}">
                        <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 6}"> 
                        <c:if test = "${piece.posY == 8}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="6${count7}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="6${count7}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="6${count7}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="6${count7}" type="Submit" value="6${count7}" class="white">
                    </c:if>  
                    </c:if>
                </form>
                <c:set var="count7" value="${count7 + 1}" scope="page"/>
            </c:forEach>

            <!--  Row 8  -->  
            <c:set var="count8" value="0" scope="page" />
            <c:forEach var="num" items="${rows}">
                <form action="${pageContext.servletContext.contextPath}/Game" method="post" class="space" >   
                    <c:if test = "${count8 == 0}">
                    <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 7}"> 
                        <c:if test = "${piece.posY == 0}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="7${count8}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="7${count8}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="7${count8}" type="Submit" value="7${count8}" class="black">
                    </c:if>  
                    </c:if>

                    <c:if test = "${count8 - 1 == 0}">
                           <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 7}"> 
                        <c:if test = "${piece.posY == 1}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="7${count8}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="7${count8}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="7${count8}" type="Submit" value="7${count8}" class="white">
                    </c:if> 
                    </c:if>

                    <c:if test = "${count8 - 2 == 0}">
                    <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 7}"> 
                        <c:if test = "${piece.posY == 2}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="7${count8}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="7${count8}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="7${count8}" type="Submit" value="7${count8}" class="black">
                    </c:if>  
                    </c:if>

                    <c:if test = "${count8 - 3 == 0}">
                    <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 7}"> 
                        <c:if test = "${piece.posY == 3}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="7${count8}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="7${count8}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="7${count8}" type="Submit" value="7${count8}" class="white">
                    </c:if> 
                    </c:if>

                      <c:if test = "${count8 - 4 == 0}">
                        <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 7}"> 
                        <c:if test = "${piece.posY == 4}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="7${count8}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="7${count8}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="7${count8}" type="Submit" value="7${count8}" class="black">
                    </c:if>  
                    </c:if>

                    <c:if test = "${count8 - 5 == 0}">
                    <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 7}"> 
                        <c:if test = "${piece.posY == 5}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="7${count8}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="7${count8}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="7${count8}" type="Submit" value="7${count8}" class="white">
                    </c:if> 
                    </c:if>

                    <c:if test = "${count8 - 6 == 0}">
                        <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 7}"> 
                        <c:if test = "${piece.posY == 6}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="7${count8}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="7${count8}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="7${count8}" type="Submit" value="7${count8}" class="black">
                    </c:if>  
                    </c:if>

                    <c:if test = "${count8 - 7 == 0}">
                    <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 7}"> 
                        <c:if test = "${piece.posY == 7}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="7${count8}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="white">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="white">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="white">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="7${count8}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="white">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="white">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="7${count8}" type="Submit" value="7${count8}" class="white">
                    </c:if> 
                    </c:if>

                    <c:if test = "${count8 - 8 == 0}">
                        <c:set var="blank" value="1" scope="page" />
                    <c:forEach var="piece" items="${pieces}">
                    <c:if test = "${piece.posX == 7}"> 
                        <c:if test = "${piece.posY == 8}"> 
                            <c:set var="blank" value="0" scope="page" />
                            <c:if test = "${piece.color == 'true'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="whiteRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="whiteKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="whiteBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="whiteKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="7${count8}" type="Submit"  value=" "img id ="whiteQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="whitePawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                            <c:if test = "${piece.color == 'false'}">
                                <c:if test = "${piece.type == 'rook'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="blackRook" src= "_view/transparent.png" class="black">
                                </c:if>  
                                <c:if test = "${piece.type == 'knight'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="blackKnight" src= "_view/transparent.png" class="black">
                                </c:if>     
                                <c:if test = "${piece.type == 'bishop'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="blackBishop" src= "_view/transparent.png" class="black">
                                </c:if>             
                                <c:if test = "${piece.type == 'king'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="blackKing" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'queen'}">
                               <input name="7${count8}" type="Submit"  value=" "img id ="blackQueen" src= "_view/transparent.png" class="black">
                                </c:if> 
                                <c:if test = "${piece.type == 'pawn'}">
                                <input name="7${count8}" type="Submit"  value=" "img id ="blackPawn" src= "_view/transparent.png" class="black">
                                </c:if> 
                            </c:if>
                        </c:if>
                    </c:if>       
                    </c:forEach> 
                    <c:if test = "${blank == 1}">
                            <input name="7${count8}" type="Submit" value="7${count8}" class="black">
                    </c:if>  
                    </c:if>
                </form>
                <c:set var="count8" value="${count8 + 1}" scope="page"/>
            </c:forEach>
            
            </div>
        </div>
        
        <c:if test = "${! empty error}">
        <div class = "errorM">
                      ${error}         
		</div>
        </c:if>
        
        
        <div class = "input">
      	
      	<form action="${pageContext.servletContext.contextPath}/Game" method="get">
            <input name="endTurn" type="Submit" value="End Turn">
        </form>
        
        <form action="${pageContext.servletContext.contextPath}/History" method="get">
            <input name="viewHistory" type="Submit" value="View History">
		</form>
            
        <form action="${pageContext.servletContext.contextPath}/Menu" method="get">
            <input name="exitGame" type="Submit" value="Exit Game">
        </form> 
        
         <form action="${pageContext.servletContext.contextPath}/Game" method="post">
            <input name="forfeit" type="Submit" value="Forfeit">
        </form> 
            
        <form action="http://www.uschess.org/index.php/Learn-About-Chess/Learn-to-Play-Chess.html">
            <input type="submit" value="Learn to Play" />
        </form>
              </div>
      	
	</body>
</html>