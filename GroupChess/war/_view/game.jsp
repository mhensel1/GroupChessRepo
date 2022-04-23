<!DOCTYPE html>

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
        .black {
                float: left;
                width: 60px;
                height: 60px;
                background-color: darkred;
                font-size:60px;
                text-align:center;
                display: table-cell;
                vertical-align:middle;
        }
        .white {
                float: left;
                width: 60px;
                height: 60px;
                background-color: #ffd9b3;
                font-size:60px;
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
      
        <div class ="player">
			White Players Turn
		</div>
        
        <div class="pieces" >
            <div style="height: 32px; background-color: #C90000;border: 3px solid #111;  color: black;
				font-size: 28px;">
                Captured Pieces
            </div>
           
        </div>
        
        <div class="text">
         <div style="height: 32px; background-color: #C90000;border: 3px solid #111;  color: black;
				font-size: 28px;">
                Player Chat
            </div>
        </div>
        
        <div class="chessboard">
            <!-- Row 1 (a8 b8 c8 d8 e8 f8 g8 h8) -->
            <div class="white"ondrop="dragDrop(event)" ondragover="allowDrop(event)"><img id="blackRook1" src= "_view/transparent.png" draggable="true" ondragstart="dragStart(event)"  width="1" height="1"> 
                
            <form action="${pageContext.servletContext.contextPath}/Game" method="get" id="form_id" class="form_class">
            <input name="selectPiece" type="hidden" value="select Piece">
            </form>
                
    
                
            </div>
            
            <div class="black"ondrop="dragDrop(event)" ondragover="allowDrop(event)"><img id="blackKnight1" src= "_view/transparent.png" draggable="true" ondragstart="dragStart(event)"  width="1" height="1"></div>
            <div class="white"ondrop="dragDrop(event)" ondragover="allowDrop(event)"><img id="blackBishop1" src= "_view/transparent.png" draggable="true" ondragstart="dragStart(event)"  width="1" height="1"></div>
            <div class="black"ondrop="dragDrop(event)" ondragover="allowDrop(event)"><img id="blackKing" src= "_view/transparent.png" draggable="true" ondragstart="dragStart(event)"  width="1" height="1"></div>
            <div class="white"ondrop="dragDrop(event)" ondragover="allowDrop(event)"><img id="blackQueen" src= "_view/transparent.png" draggable="true" ondragstart="dragStart(event)"  width="1" height="1"></div>
            <div class="black"ondrop="dragDrop(event)" ondragover="allowDrop(event)"><img id="blackRook2" src= "_view/transparent.png" draggable="true" ondragstart="dragStart(event)"  width="1" height="1"></div>
            <div class="white"ondrop="dragDrop(event)" ondragover="allowDrop(event)"><img id="blackKnight2" src= "_view/transparent.png" draggable="true" ondragstart="dragStart(event)"  width="1" height="1"></div>
            <div class="black"ondrop="dragDrop(event)" ondragover="allowDrop(event)"><img id="blackBishop2" src= "_view/transparent.png" draggable="true" ondragstart="dragStart(event)"  width="1" height="1"></div>

            <!-- Row 2 a7 b7 c7 d7 e7 f7 g7 h7 -->
            <div class="black" ondrop="dragDrop(event)" ondragover="allowDrop(event)"><img id="blackPawn1" src= "_view/transparent.png" draggable="true" ondragstart="dragStart(event)"  width="1" height="1"></div>
            
            <div class="white"ondrop="dragDrop(event)" ondragover="allowDrop(event)"><img id="blackPawn2" src= "_view/transparent.png" draggable="true" ondragstart="dragStart(event)"  width="1" height="1"></div>
            
            <div class="black"ondrop="dragDrop(event)" ondragover="allowDrop(event)"><img id="blackPawn3" src= "_view/transparent.png" draggable="true" ondragstart="dragStart(event)"  width="1" height="1"></div>
            
            <div class="white"ondrop="dragDrop(event)" ondragover="allowDrop(event)"><img id="blackPawn4" src= "_view/transparent.png" draggable="true" ondragstart="dragStart(event)"  width="1" height="1"></div>
            
            <div class="black"ondrop="dragDrop(event)" ondragover="allowDrop(event)"><img id="blackPawn5" src= "_view/transparent.png" draggable="true" ondragstart="dragStart(event)"  width="1" height="1"></div>
            
            <div class="white"ondrop="dragDrop(event)" ondragover="allowDrop(event)"><img id="blackPawn6" src= "_view/transparent.png" draggable="true" ondragstart="dragStart(event)"  width="1" height="1"></div>
            
            <div class="black"ondrop="dragDrop(event)" ondragover="allowDrop(event)"><img id="blackPawn7" src= "_view/transparent.png" draggable="true" ondragstart="dragStart(event)"  width="1" height="1"></div>
            
            <div class="white"ondrop="dragDrop(event)" ondragover="allowDrop(event)"><img id="blackPawn8" src= "_view/transparent.png" draggable="true" ondragstart="dragStart(event)"  width="1" height="1"></div>

            <!-- Row 3 a6 b6 c6 d6 e6 f6 g6 h6 -->
            <div class="white"ondrop="dragDrop(event)" ondragover="allowDrop(event)"></div>
            <div class="black"ondrop="dragDrop(event)" ondragover="allowDrop(event)"></div>
            <div class="white"ondrop="dragDrop(event)" ondragover="allowDrop(event)"></div>
            <div class="black"ondrop="dragDrop(event)" ondragover="allowDrop(event)"></div>
            <div class="white"ondrop="dragDrop(event)" ondragover="allowDrop(event)"></div>
            <div class="black"ondrop="dragDrop(event)" ondragover="allowDrop(event)"></div>
            <div class="white"ondrop="dragDrop(event)" ondragover="allowDrop(event)"></div>
            <div class="black"ondrop="dragDrop(event)" ondragover="allowDrop(event)"></div>

            <!-- Row 4 a5 b5 c5 d5 e5 f5 g5 h5 -->
            <div class="black"ondrop="dragDrop(event)" ondragover="allowDrop(event)"></div>
            <div class="white"ondrop="dragDrop(event)" ondragover="allowDrop(event)"></div>
            <div class="black"ondrop="dragDrop(event)" ondragover="allowDrop(event)"></div>
            <div class="white"ondrop="dragDrop(event)" ondragover="allowDrop(event)"></div>
            <div class="black"ondrop="dragDrop(event)" ondragover="allowDrop(event)"></div>
            <div class="white"ondrop="dragDrop(event)" ondragover="allowDrop(event)"></div>
            <div class="black"ondrop="dragDrop(event)" ondragover="allowDrop(event)"></div>
            <div class="white" ondrop="dragDrop(event)" ondragover="allowDrop(event)"></div>

            <!-- Row 5 a4 b4 c4 d4 e4 f4 g4 h4 -->
            <div class="white"ondrop="dragDrop(event)" ondragover="allowDrop(event)"></div>
            <div class="black"ondrop="dragDrop(event)" ondragover="allowDrop(event)"></div>
            <div class="white"ondrop="dragDrop(event)" ondragover="allowDrop(event)"></div>
            <div class="black"ondrop="dragDrop(event)" ondragover="allowDrop(event)"></div>
            <div class="white"ondrop="dragDrop(event)" ondragover="allowDrop(event)"></div>
            <div class="black"ondrop="dragDrop(event)" ondragover="allowDrop(event)"></div>
            <div class="white"ondrop="dragDrop(event)" ondragover="allowDrop(event)"></div>
            <div class="black"ondrop="dragDrop(event)" ondragover="allowDrop(event)"></div>

            <!-- Row 6 a3 b3 c3 d3 e3 f3 g3 h3 -->
            <div class="black"ondrop="dragDrop(event)" ondragover="allowDrop(event)"></div>
            <div class="white"ondrop="dragDrop(event)" ondragover="allowDrop(event)"></div>
            <div class="black"ondrop="dragDrop(event)" ondragover="allowDrop(event)"></div>
            <div class="white"ondrop="dragDrop(event)" ondragover="allowDrop(event)"></div>
            <div class="black"ondrop="dragDrop(event)" ondragover="allowDrop(event)"></div>
            <div class="white"ondrop="dragDrop(event)" ondragover="allowDrop(event)"></div>
            <div class="black"ondrop="dragDrop(event)" ondragover="allowDrop(event)"></div>
            <div class="white" ondrop="dragDrop(event)" ondragover="allowDrop(event)"></div>

            <!-- Row 7 a2 b2 c2 d2 e2 f2 g2 h2 -->
            <div class="white"ondrop="dragDrop(event)" ondragover="allowDrop(event)"><img id="whitePawn1" src= "_view/transparent.png" draggable="true" ondragstart="dragStart(event)"  width="1" height="1"> </div>
            <div class="black"ondrop="dragDrop(event)" ondragover="allowDrop(event)"><img id="whitePawn2" src= "_view/transparent.png" draggable="true" ondragstart="dragStart(event)"  width="1" height="1"></div>
            <div class="white"ondrop="dragDrop(event)" ondragover="allowDrop(event)"><img id="whitePawn3" src= "_view/transparent.png" draggable="true" ondragstart="dragStart(event)"  width="1" height="1"></div>
            <div class="black"ondrop="dragDrop(event)" ondragover="allowDrop(event)"><img id="whitePawn4" src= "_view/transparent.png" draggable="true" ondragstart="dragStart(event)"  width="1" height="1"></div>
            <div class="white"ondrop="dragDrop(event)" ondragover="allowDrop(event)"><img id="whitePawn5" src= "_view/transparent.png" draggable="true" ondragstart="dragStart(event)"  width="1" height="1"></div>
            <div class="black"ondrop="dragDrop(event)" ondragover="allowDrop(event)"><img id="whitePawn6" src= "_view/transparent.png" draggable="true" ondragstart="dragStart(event)"  width="1" height="1"></div>
            <div class="white"ondrop="dragDrop(event)" ondragover="allowDrop(event)"><img id="whitePawn7" src= "_view/transparent.png" draggable="true" ondragstart="dragStart(event)"  width="1" height="1"></div>
            <div class="black"ondrop="dragDrop(event)" ondragover="allowDrop(event)"><img id="whitePawn8" src= "_view/transparent.png" draggable="true" ondragstart="dragStart(event)"  width="1" height="1"></div>

            <!-- Row 8 a1 b1 c1 d1 e1 f1 g1 h1 -->
            <div class="black" ondrop="dragDrop(event)" ondragover="allowDrop(event)"><img id="whiteRook1" src= "_view/transparent.png" draggable="true" ondragstart="dragStart(event)"  width="1" height="1"></div>
            <div class="white"ondrop="dragDrop(event)" ondragover="allowDrop(event)"><img id="whiteKnight1" src= "_view/transparent.png" draggable="true" ondragstart="dragStart(event)"  width="1" height="1"></div>
            <div class="black"ondrop="dragDrop(event)" ondragover="allowDrop(event)"><img id="whiteBishop1" src= "_view/transparent.png" draggable="true" ondragstart="dragStart(event)"  width="1" height="1"></div>
            <div class="white"ondrop="dragDrop(event)" ondragover="allowDrop(event)"><img id="whiteKing" src= "_view/transparent.png" draggable="true" ondragstart="dragStart(event)"  width="1" height="1"></div>
            <div class="black"ondrop="dragDrop(event)" ondragover="allowDrop(event)"><img id="whiteQueen" src= "_view/transparent.png" draggable="true" ondragstart="dragStart(event)"  width="1" height="1"></div>
            <div class="white"ondrop="dragDrop(event)" ondragover="allowDrop(event)"><img id="whiteBishop2" src= "_view/transparent.png" draggable="true" ondragstart="dragStart(event)"  width="1" height="1"></div>
            <div class="black"ondrop="dragDrop(event)" ondragover="allowDrop(event)"><img id="whiteKnight2" src= "_view/transparent.png" draggable="true" ondragstart="dragStart(event)"  width="1" height="1"></div>
            <div class="white"ondrop="dragDrop(event)" ondragover="allowDrop(event)"><img id="whiteRook2" src= "_view/transparent.png" draggable="true" ondragstart="dragStart(event)"  width="1" height="1"></div>
        </div>
        
		<div class = "input">
            
        <form action="${pageContext.servletContext.contextPath}/Game" method="get">
            <input name="endTurn" type="Submit" value="End Turn">
        </form>
            
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