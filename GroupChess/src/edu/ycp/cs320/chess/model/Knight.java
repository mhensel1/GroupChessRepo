package edu.ycp.cs320.chess.model;

public class Knight extends ChessPiece {
	
    public Knight(boolean white)
    {
        super(white);
    }
  
    @Override
    public boolean canMove(ChessBoard board, BoardSpace start, BoardSpace end) {
        if (end.getPiece().getColor() == this.getColor()) {
            return false;
        }
        return false;
    }
}