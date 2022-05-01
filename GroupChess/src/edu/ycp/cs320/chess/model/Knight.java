package edu.ycp.cs320.chess.model;

// model class for knight

public class Knight extends ChessPiece{
	
	
	
	public Knight(boolean color, boolean captured, boolean hasMoved, int x, int y){
		
        super(color, captured, hasMoved, x, y);
    }
	
	public boolean validateMove(int x, int y) {
		int deltaX = Math.abs(super.getX() - x);
		int deltaY = Math.abs(super.getY() - y);
		
		if((deltaX == 2 && deltaY == 1) || (deltaY == 2 && deltaX == 1)) {
			//check collision here
			if(!super.getDb().findPieceByXY(x, y).isEmpty()) {
				return false;
			}
			super.setHasMoved(true);
			return true;
		}
		
		//stub
		return false;
	}
	
}