package edu.ycp.cs320.chess.model;

public abstract class ChessPiece {
	  
    private boolean captured = false;
    private boolean hasMoved = false;
    private boolean color = false;
  
    public ChessPiece(boolean color) {
        this.setColor(color);
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
	
  
    public abstract boolean canMove(ChessBoard board, BoardSpace start, BoardSpace end);
}