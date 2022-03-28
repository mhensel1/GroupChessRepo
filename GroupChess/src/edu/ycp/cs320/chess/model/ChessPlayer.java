package edu.ycp.cs320.chess.model;

// model class for ChessPlayer

public class ChessPlayer {
	private boolean color;
	private ChessPiece[] pieces;
	//T = black
	//F = white
	
	public ChessPlayer() {
		
	}
	
	public void setColor(Boolean color) {
		this.color = color;
	}
	
	public boolean getColor() {
		return color;
	}

}