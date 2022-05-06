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
    public boolean validateMove(int gameId, int x, int y){
    	int oldX = super.getX();
    	int oldY = super.getY();
    	int deltaX = Math.abs(oldX - x);
    	int deltaY = Math.abs(oldY - y);
    	if (deltaX == deltaY && deltaY != 0) {
    		//add collision check here
    		if(!super.getDb().findPieceByColorAndXY(super.getColor(), x, y, gameId).isEmpty()) {
    			return false;
    		}
    		if(y - oldY < 0 && x - oldX < 0 ) {
    			for (int i = 0; i != deltaY ;i++) {
    				List<Piece> pieceList = super.getDb().findPieceByXY(x+i, y+i, gameId);
    				if(!pieceList.isEmpty()) {
    					return false;
    				}
    			}
    		}else if(y - oldY < 0 && x - oldX > 0) {
    			for (int i = 0; i != deltaY ;i++) {
    				List<Piece> pieceList = super.getDb().findPieceByXY(x+i, y-i, gameId);
    				if(!pieceList.isEmpty()) {
    					return false;
    				}
    			}
    		}else if(y - oldY > 0 && x - oldX < 0) {
    			for (int i = 0; i != deltaY ;i++) {
    				List<Piece> pieceList = super.getDb().findPieceByXY(x-i, y+i, gameId);
    				if(!pieceList.isEmpty()) {
    					return false;
    				}
    			}
    			return true;
    		}else if(y - oldY > 0 && x - oldX > 0) {
    			for (int i = 0; i != deltaY ;i++) {
    				List<Piece> pieceList = super.getDb().findPieceByXY(x-i, y-i, gameId);
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