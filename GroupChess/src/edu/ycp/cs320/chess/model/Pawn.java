package edu.ycp.cs320.chess.model;

public class Pawn extends ChessPiece {
	
    public Pawn(boolean white)
    {
        super(white);
    }
  
    @Override
    public boolean canMove(ChessBoard board, BoardSpace startSpace, BoardSpace endSpace) {
    	// we can't move the piece to a spot that has
        // a piece of the same color
    	//System.out.println(endSpace.getPiece());
    	
    	if (endSpace.getPiece() != null) {
    		 if (endSpace.getPiece().getColor() == this.getColor()) {
    	        	//System.out.println(endSpace.getPiece().isWhite());
    	            return false;
    	        }
    	}
    	
       	//System.out.println(startSpace.getX() + " " + endSpace.getX());
    	//System.out.println(startSpace.getY() + " " + endSpace.getY());
    	//System.out.println(endSpace.getX() - startSpace.getX());
        if (endSpace.getX() - startSpace.getX() <= 2 && endSpace.getX() - startSpace.getX() > 0 && endSpace.getY() - startSpace.getY() == 0 ) {
        	return true;
        }
        
        else {
        	return false;
        }
    }
}