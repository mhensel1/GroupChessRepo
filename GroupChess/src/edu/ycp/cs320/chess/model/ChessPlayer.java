package edu.ycp.cs320.chess.model;

// model class for ChessPlayer

public class ChessPlayer {
	private boolean color;
	private int userId;
	//T = black
	//F = white
	
	public ChessPlayer() {
		
	}
	
	public void setPlayerId(int userId) {
		this.userId = userId;
	}
	
	public int getPlayerId() {
		return userId;
	}
	
	public void setColor(Boolean color) {
		this.color = color;
	}
	
	public boolean getColor() {
		return color;
	}

}