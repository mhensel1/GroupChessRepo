package edu.ycp.cs320.chess.model;

import java.util.ArrayList;

// model class for ChessPiece

abstract class ChessPiece {
	private int posX;
	private int posY;
	private boolean hasMoved;
	private boolean color;
	
	public ChessPiece() {
		hasMoved = false;
	}
	
	public ChessPiece(int x, int y) {
		this.posX = x;
		this.posY = y;
		hasMoved = false;
	}
	
	public void setposX(int X) {
		this.posX = X;
	}
	
	public void setposY(int Y) {
		this.posY = Y;
	}
	
	public void setColor(boolean color) {
		this.color = color;
	}
	
	public int getposX() {
		return posX;
	}
	
	public int getposY() {
		return posY;
	}
	
	public boolean getHasMoved() {
		return hasMoved;
	}
	
	public boolean getColor() {
		return color;
	}
	
	public abstract ArrayList<BoardSpace> getMoves(ChessBoard board);
}
