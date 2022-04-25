package edu.ycp.cs320.chess.model;

public abstract class ChessPiece {
	  
    private int pieceId;
	private boolean captured;
    private boolean hasMoved;
    private boolean color;
    private int x;
    private int y;
  
    public ChessPiece(boolean color, boolean captured, boolean hasMoved, int x, int y) {
        this.setColor(color);
        this.setCaptured(captured);
        this.setHasMoved(hasMoved);
        this.setX(x);
        this.setY(y);
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
  
    public boolean captured() {
        return this.captured;
    }
  
    public void setCaptured(boolean captured) {
        this.captured = captured;
    }
    
    public void setHasMoved(boolean moved) {
        this.hasMoved = moved;
    }
    
	public boolean hasMoved() {
		return hasMoved;
	}
	
  
    public abstract boolean validateMove(int x, int y);
}