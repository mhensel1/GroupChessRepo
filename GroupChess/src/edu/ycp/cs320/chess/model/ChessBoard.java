package edu.ycp.cs320.chess.model;

public class ChessBoard {
    BoardSpace[][] BoardSpacesArray;
  
    public ChessBoard() {
    	BoardSpacesArray = new BoardSpace[8][8];
        this.createBoard();
    }
  
    public BoardSpace getSpace(int x, int y){
  
        return BoardSpacesArray[x][y];
    }
  
    public void createBoard()
    {
    	BoardSpacesArray[0][0] = new BoardSpace(0, 0, new Rook(true));
    	BoardSpacesArray[0][1] = new BoardSpace(0, 1, new Knight(true));
    	BoardSpacesArray[0][2] = new BoardSpace(0, 2, new Bishop(true));
    	BoardSpacesArray[0][3] = new BoardSpace(0, 3, new Queen(true));
    	BoardSpacesArray[0][4] = new BoardSpace(0, 4, new King(true));
    	BoardSpacesArray[0][5] = new BoardSpace(0, 5, new Bishop(true));
    	BoardSpacesArray[0][6] = new BoardSpace(0, 6, new Knight(true));
    	BoardSpacesArray[0][7] = new BoardSpace(0, 7, new Rook(true));
        
    	BoardSpacesArray[1][0] = new BoardSpace(1, 0, new Pawn(true));
    	BoardSpacesArray[1][1] = new BoardSpace(1, 1, new Pawn(true));
    	BoardSpacesArray[1][2] = new BoardSpace(1, 2, new Pawn(true));
    	BoardSpacesArray[1][3] = new BoardSpace(1, 3, new Pawn(true));
    	BoardSpacesArray[1][4] = new BoardSpace(1, 4, new Pawn(true));
    	BoardSpacesArray[1][5] = new BoardSpace(1, 5, new Pawn(true));
    	BoardSpacesArray[1][6] = new BoardSpace(1, 6, new Pawn(true));
        BoardSpacesArray[1][7] = new BoardSpace(1, 7, new Pawn(true));
        
        BoardSpacesArray[6][0] = new BoardSpace(1, 0, new Pawn(false));
        BoardSpacesArray[6][1] = new BoardSpace(1, 1, new Pawn(false));
        BoardSpacesArray[6][2] = new BoardSpace(1, 2, new Pawn(false));
        BoardSpacesArray[6][3] = new BoardSpace(1, 3, new Pawn(false));
        BoardSpacesArray[6][4] = new BoardSpace(1, 4, new Pawn(false));
        BoardSpacesArray[6][5] = new BoardSpace(1, 5, new Pawn(false));
        BoardSpacesArray[6][6] = new BoardSpace(1, 6, new Pawn(false));
        BoardSpacesArray[6][7] = new BoardSpace(1, 7, new Pawn(false));
        
        BoardSpacesArray[7][0] = new BoardSpace(0, 0, new Rook(false));
        BoardSpacesArray[7][1] = new BoardSpace(0, 1, new Knight(false));
        BoardSpacesArray[7][2] = new BoardSpace(0, 2, new Bishop(false));
        BoardSpacesArray[7][3] = new BoardSpace(0, 3, new Queen(false));
        BoardSpacesArray[7][4] = new BoardSpace(0, 4, new King(false));
        BoardSpacesArray[7][5] = new BoardSpace(0, 5, new Bishop(false));
        BoardSpacesArray[7][6] = new BoardSpace(0, 6, new Knight(false));
        BoardSpacesArray[7][7] = new BoardSpace(0, 7, new Rook(false));
         
        // initialize remaining BoardSpacesArray without any piece
        for (int i = 2; i < 6; i++) {
            for (int j = 0; j < 8; j++) {
                BoardSpacesArray[i][j] = new BoardSpace(i, j, null);
            }
        }
    }
}