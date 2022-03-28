package edu.ycp.cs320.chess.model;

import java.util.ArrayList;

// model class for queen

public class Queen extends ChessPiece{
	
	public Queen() {	
	}
	
	public ArrayList<BoardSpace> getMoves(ChessBoard board){
		ArrayList<BoardSpace> moves = new ArrayList<BoardSpace>();
		int x = super.getposX();
		int y = super.getposY();
		int i;
		for(i = 0; i < y; i++) {
			moves.add(new BoardSpace(i, super.getposY()));
		}
		for(i = 7; i > y; i--) {
			moves.add(new BoardSpace(i, super.getposY()));
		}
		for(i = 0; i < x; i++) {
			moves.add(new BoardSpace(super.getposX(), i));
		}
		for(i = 7; i > x; i--) {
			moves.add(new BoardSpace(super.getposX(), i));
		}
		for(i = 1; i < 7; i++) {
			if(y+i <=7 && x+i <= 7) moves.add(new BoardSpace(x+1, y+1));
			if(y-i >=0 && x+i <= 7) moves.add(new BoardSpace(x+1, y-1));
			if(y-i >=0 && x-i >= 0) moves.add(new BoardSpace(x-1, y-1));
			if(y+i <=7 && x-i >= 0) moves.add(new BoardSpace(x-1, y+1));
		}
		return moves;
	}
	
}