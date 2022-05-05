package edu.ycp.cs320.chess.model;

import edu.ycp.cs320.gamesDB.persist.DatabaseProvider;
import edu.ycp.cs320.gamesDB.persist.DerbyDatabase;
import edu.ycp.cs320.gamesDB.persist.IDatabase;
import edu.ycp.cs320.gamesDB.model.Piece;

public abstract class ChessPiece {
	  
    private int pieceId;
	private boolean captured;
    private boolean hasMoved;
    private boolean color;
    private int x;
    private int y;
    private IDatabase db = null;
  
    public ChessPiece(boolean color, boolean captured, boolean hasMoved, int x, int y) {
        this.setColor(color);
        this.setCaptured(captured);
        this.setHasMoved(hasMoved);
        this.setX(x);
        this.setY(y);
        db = DatabaseProvider.getInstance();
    }
    
    public int getX() {
    	return x;
    }
    
    public void setX(int x) {
    	this.x = x;
    }
    
    public int getY() {
    	return y;
    }
    
    public void setY(int y) {
    	this.y = y;
    }
  
    public boolean getColor() {
        return color;
    }
  
    public void setColor(boolean color) {
        this.color = color;
    }
  
    public boolean getCaptured() {
        return this.captured;
    }
  
    public void setCaptured(boolean captured) {
        this.captured = captured;
    }
    
    public void setHasMoved(boolean moved) {
        this.hasMoved = moved;
    }
    
	public boolean getHasMoved() {
		return hasMoved;
	}
	
	public IDatabase getDb() {
		return db;
	}
	
  
    public abstract boolean validateMove(int gameId, int x, int y);
}