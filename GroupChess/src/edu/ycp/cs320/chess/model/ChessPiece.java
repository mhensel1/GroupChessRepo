package edu.ycp.cs320.chess.model;

// model class for ChessPiece

public class ChessPiece {
	private int posX;
	private int posY;
	
	public ChessPiece() {
	}
	
	public void setposX(int X) {
		this.posX = X;
	}
	
	public void setposY(int Y) {
		this.posY = Y;
	}
	
	public int getposX() {
		return posX;
	}
	
	public int getposY() {
		return posY;
	}
}
