package edu.ycp.cs320.chess.model;

import java.util.List;

import edu.ycp.cs320.gamesDB.model.Piece;

public class Rook extends ChessPiece {
	
	public Rook(boolean color, boolean captured, boolean hasMoved, int x, int y){
		
        super(color, captured, hasMoved, x, y);
    }
  
    @Override
    public boolean validateMove(int x, int y) {
    	int oldX = super.getX();
    	int oldY = super.getY();
    	int deltaX = Math.abs(super.getX() - x);
    	int deltaY = Math.abs(super.getY() - y);
		if(!super.getDb().findPieceByColorAndXY(super.getColor(), x, y).isEmpty()) {
			return false;
		}
    	if(deltaX == 0 && oldY - y < 0) {
    		//check collision here
    		for (int i = 0; i != deltaX ;i++) {
				List<Piece> pieceList = super.getDb().findPieceByXY(x, y-i);
				if(!pieceList.isEmpty()) {
					return false;
				}
			}
    		return true;
    	}else if(deltaX == 0 && oldY - y > 0) {
    		for (int i = 0; i != deltaX ;i++) {
				List<Piece> pieceList = super.getDb().findPieceByXY(x, y+i);
				if(!pieceList.isEmpty()) {
					return false;
				}
			}
    		return true;
    	}else if(deltaY == 0 && oldX - x < 0) {
    		for (int i = 0; i != deltaX ;i++) {
				List<Piece> pieceList = super.getDb().findPieceByXY(x-i, y);
				if(!pieceList.isEmpty()) {
					return false;
				}
			}
    		return true;
    	}else if(deltaY == 0 && oldX - x > 0) {
    		for (int i = 0; i != deltaX ;i++) {
				List<Piece> pieceList = super.getDb().findPieceByXY(x+i, y);
				if(!pieceList.isEmpty()) {
					return false;
				}
			}
    		super.setHasMoved(true);
    		return true;
    	}
    	return false;
    }
}