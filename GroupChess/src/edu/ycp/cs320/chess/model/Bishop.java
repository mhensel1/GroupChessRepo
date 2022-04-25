package edu.ycp.cs320.chess.model;

public class Bishop extends ChessPiece {
    
	public Bishop(boolean color, boolean captured, boolean hasMoved, int x, int y){
		
        super(color, captured, hasMoved, x, y);
    }
  
    @Override
    public boolean validateMove(int x, int y){
    	int deltaX = Math.abs(super.getX() - x);
    	int deltaY = Math.abs(super.getY() - y);
    	if (deltaX == deltaY && deltaX != 0) {
    		//add collision check here
    		return true;
    	}
    	//stub
    	return false;
    }
    
}