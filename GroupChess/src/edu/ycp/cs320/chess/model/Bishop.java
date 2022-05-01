package edu.ycp.cs320.chess.model;

import java.util.List;
import edu.ycp.cs320.gamesDB.persist.DatabaseProvider;
import edu.ycp.cs320.gamesDB.persist.DerbyDatabase;
import edu.ycp.cs320.gamesDB.persist.IDatabase;
import edu.ycp.cs320.gamesDB.model.Piece;

public class Bishop extends ChessPiece {
    
	public Bishop(boolean color, boolean captured, boolean hasMoved, int x, int y){
		
        super(color, captured, hasMoved, x, y);
        
    }
  
    @Override
    public boolean validateMove(int x, int y){
    	int oldX = super.getX();
    	int oldY = super.getY();
    	int deltaX = Math.abs(oldX - x);
    	int deltaY = Math.abs(oldY - y);
    	if (deltaX == deltaY && deltaX != 0) {
    		//add collision check here
    		if(!super.getDb().findPieceByColorAndXY(super.getColor(), x, y).isEmpty()) {
    			return false;
    		}
    		if(x - oldX < 0 && y - oldY < 0 ) {
    			for (int i = 0; i != deltaX ;i++) {
    				List<Piece> pieceList = super.getDb().findPieceByXY(x+i, y+i);
    				if(!pieceList.isEmpty()) {
    					return false;
    				}
    			}
    		}else if(x - oldX < 0 && y - oldY > 0) {
    			for (int i = 0; i != deltaX ;i++) {
    				List<Piece> pieceList = super.getDb().findPieceByXY(x+i, y-i);
    				if(!pieceList.isEmpty()) {
    					return false;
    				}
    			}
    		}else if(x - oldX > 0 && y - oldY < 0) {
    			for (int i = 0; i != deltaX ;i++) {
    				List<Piece> pieceList = super.getDb().findPieceByXY(x-i, y+i);
    				if(!pieceList.isEmpty()) {
    					return false;
    				}
    			}
    			return true;
    		}else if(x - oldX > 0 && y - oldY > 0) {
    			for (int i = 0; i != deltaX ;i++) {
    				List<Piece> pieceList = super.getDb().findPieceByXY(x-i, y-i);
    				if(!pieceList.isEmpty()) {
    					return false;
    				}
    			}
    		}
    		super.setHasMoved(true);
    		return true;
    	}
    	//stub
    	return false;
    }
    
}