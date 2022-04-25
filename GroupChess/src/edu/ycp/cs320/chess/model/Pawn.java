package edu.ycp.cs320.chess.model;

public class Pawn extends ChessPiece {
	
	public Pawn(boolean color, boolean captured, boolean hasMoved, int x, int y){
		
        super(color, captured, hasMoved, x, y);
    }
  
    @Override
    public boolean validateMove(int x, int y) {
    	
    	int deltaX = super.getX() - x;
    	int deltaY = super.getY() - y;
    	
    	if(super.getColor()) {
    		if(deltaY == -1 /*query xy*/) {
    			return true;
    		}
    	}
    	
        //stub 
       	return false;
    }
}