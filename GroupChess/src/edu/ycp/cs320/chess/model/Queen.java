package edu.ycp.cs320.chess.model;

public class Queen extends ChessPiece {
	
    public Queen(boolean white) {
        super(white);
    }
  
    @Override
    public boolean canMove(ChessBoard board, BoardSpace start, BoardSpace end) {
            return true;
     }
}