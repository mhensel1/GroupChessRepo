package edu.ycp.cs320.chess.model;

public class Pawn extends ChessPiece {
	
	public Pawn(boolean color, boolean captured, boolean hasMoved, int x, int y){
        super(color, captured, hasMoved, x, y);
    }
  
    @Override
    public boolean validateMove(int gameId, int x, int y) {
    	System.out.println("Super x: " + super.getX() +  " Super y: " + super.getY());
    	int deltaX = super.getX() - x;
    	int deltaY = Math.abs(super.getY() - y);
    	
    	if(super.getColor()) {
    		if(deltaX == -1 /*query xy*/) {
    			if(deltaY == 1 && !super.getDb().findPieceByColorAndXY(!super.getColor(), x, y, gameId).isEmpty()) {
    				System.out.println("look here" + super.getDb().findPieceByXY(x, y, gameId));
    				return true;
    			}else if(deltaY == 0 && super.getDb().findPieceByXY(x, y, gameId).isEmpty()) {
    				System.out.println("look here" + super.getDb().findPieceByXY(x, y, gameId));
    				return true;
    			}else {
    				System.out.println("look here" + super.getDb().findPieceByXY(x, y, gameId));
    				return false;
    			}
    		}else if(deltaX == -2) {
    			if(deltaY == 0 && !super.getHasMoved() && super.getDb().findPieceByXY(x, y, gameId).isEmpty()) {
    				System.out.println("look here" + super.getDb().findPieceByXY(x, y, gameId));
    				return true;
    			}else {
    				System.out.println("look here" + super.getDb().findPieceByXY(x, y, gameId));
    				return false;
    			}
    		}
    	}else {
    		if(deltaX == 1 /*query xy*/) {
    			if(deltaX == 1 && !super.getDb().findPieceByColorAndXY(!super.getColor(), x, y, gameId).isEmpty()) {
    				System.out.println("look here" + super.getDb().findPieceByXY(x, y, gameId));
    				return true;
    			}else if(deltaY == 0 && super.getDb().findPieceByXY(x, y, gameId).isEmpty()) {
    				System.out.println("look here" + super.getDb().findPieceByXY(x, y, gameId));
    				return true;
    			}else {
    				System.out.println("look here" + super.getDb().findPieceByXY(x, y, gameId));
    				return false;
    			}
    		}else if(deltaX == 2) {
    			if(deltaY == 0 && !super.getHasMoved() && super.getDb().findPieceByXY(x, y, gameId).isEmpty()) {
    				return true;
    			}else {
    				return false;
    			}
    		}
    	}
    	
       	return false;
    }
}