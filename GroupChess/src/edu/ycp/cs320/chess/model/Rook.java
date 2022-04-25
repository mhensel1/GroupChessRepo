package edu.ycp.cs320.chess.model;

public class Rook extends ChessPiece {
	
	public Rook(boolean color, boolean captured, boolean hasMoved, int x, int y){
		
        super(color, captured, hasMoved, x, y);
    }
  
    @Override
    public boolean validateMove(int x, int y) {
    	
    	int deltaX = Math.abs(super.getX() - x);
    	int deltaY = Math.abs(super.getY() - y);
    	
    	if(deltaX == 0 ^ deltaY == 0) {
    		//check collision here
    		return true;
    	}
    	
    	//stub
    	return false;
    }
}