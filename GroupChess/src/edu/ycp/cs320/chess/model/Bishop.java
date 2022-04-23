package edu.ycp.cs320.chess.model;

public class Bishop extends ChessPiece {
    
	public Bishop(boolean color){
		
        super(color);
    }
  
    @Override
    public boolean canMove(ChessBoard board, BoardSpace start, BoardSpace end){
    	return false;
    }
    
}