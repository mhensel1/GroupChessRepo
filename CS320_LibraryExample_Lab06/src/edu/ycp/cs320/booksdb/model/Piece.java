package edu.ycp.cs320.booksdb.model;

public class Piece {
	private int gameId;
	private boolean color; //true = white, false = black
	private int PosX;
	private int PosY;
	private boolean hasMoved;
	private String type;
	private boolean captured;
	//true|2|0|0|true|rook|false
	public Piece() {
		
	}
	
	public void setColor(Boolean color) {
		this.color = color;
	}
	
	public boolean getColor() {
		return color;
	}
	
	public void setGameId(int gameId) {
		this.gameId = gameId;
	}
	
	public int getGameId() {
		return gameId;
	}
	
	public void setPosX(int X) {
		this.PosX = X;
	}
	
	public int getPosX() {
		return PosX;
	}
	
	public void setPosY(int Y) {
		this.PosY = Y;
	}
	
	public int getPosY() {
		return PosY;
	}
	
	public void setHasMoved(Boolean hasMoved) {
		this.hasMoved = hasMoved;
	}
	
	public boolean getHasMoved() {
		return hasMoved;
	}
	
	public void setType(String type) {
		this.type = type;
	}
	
	public String getType() {
		return type;
	}
	
	public void setCaptured(Boolean captured) {
		this.captured = captured;
	}
	
	public boolean getCaptured() {
		return captured;
	}
}
