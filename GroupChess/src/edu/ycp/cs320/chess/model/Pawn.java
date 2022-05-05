package edu.ycp.cs320.chess.model;

public class Pawn extends ChessPiece {
	
	public Pawn(boolean color, boolean captured, boolean hasMoved, int x, int y){
		
        super(color, captured, hasMoved, x, y);
    }
  
    @Override
    public boolean validateMove(int gameId, int x, int y) {
    	
    	int deltaX = Math.abs(super.getX() - x);
    	int deltaY = super.getY() - y;
    	
    	if(super.getColor()) {
    		if(deltaY == -1 /*query xy*/) {
    			if(deltaX == 1 && !super.getDb().findPieceByColorAndXY(!super.getColor(), x, y, gameId).isEmpty()) {
    				return true;
    			}else if(deltaX == 0 && super.getDb().findPieceByXY(x, y, gameId).isEmpty()) {
    				return true;
    			}else {
    				return false;
    			}
    		}else if(deltaY == -2) {
    			if(deltaX == 0 && !super.getHasMoved() && super.getDb().findPieceByXY(x, y, gameId).isEmpty()) {
    				return true;
    			}else {
    				return false;
    			}
    		}
    	}else {
    		if(deltaY == 1 /*query xy*/) {
    			if(deltaX == 1 && !super.getDb().findPieceByColorAndXY(!super.getColor(), x, y, gameId).isEmpty()) {
    				return true;
    			}else if(deltaX == 0 && super.getDb().findPieceByXY(x, y).isEmpty()) {
    				return true;
    			}else {
    				return false;
    			}
    		}else if(deltaY == 2) {
    			if(deltaX == 0 && !super.getHasMoved() && super.getDb().findPieceByXY(x, y, gameId).isEmpty()) {
    				return true;
    			}else {
    				return false;
    			}
    		}
    	}
    	
       	return false;
    }
}